defmodule CbsWeb.Router do
  use CbsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", CbsWeb do
    pipe_through :api

    resources "/users", UserController
    resources "/adress", AdressController
    resources "/accounts", AccountsController
    resources "/deposit", DepositController
    resources "/withdrawal", WithdrawalController

  end
end
