defmodule CbsWeb.Router do
  use CbsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug CbsWeb.ApiAuthPlug, otp_app: :cbs
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: WarehouseApiWeb.ApiAuthErrorHandler
  end

  scope "/api/v1", CbsWeb do
    pipe_through :api

    post "/login", UserController, :login

    resources "/users", UserController
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
  end

  scope "/api/v1", CbsWeb do
    pipe_through [:api, :api_protected]

    resources "/adress", AdressController
    resources "/accounts", AccountsController
    resources "/deposit", DepositController
    resources "/withdrawal", WithdrawalController
  end
end
