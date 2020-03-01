defmodule CbsWeb.AccountsController do
  use CbsWeb, :controller

  alias Cbs.Main
  alias Cbs.Main.Accounts

  action_fallback CbsWeb.FallbackController

  def index(conn, _params) do
    accounts = Main.list_accounts()
    render(conn, "index.json", accounts: accounts)
  end

  def create(conn, %{"accounts" => accounts_params}) do
    with {:ok, %Accounts{} = accounts} <- Main.create_accounts(accounts_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.accounts_path(conn, :show, accounts))
      |> render("show.json", accounts: accounts)
    end
  end

  def show(conn, %{"id" => id}) do
    accounts = Main.get_accounts!(id)
    render(conn, "show.json", accounts: accounts)
  end

  def update(conn, %{"id" => id, "accounts" => accounts_params}) do
    accounts = Main.get_accounts!(id)

    with {:ok, %Accounts{} = accounts} <- Main.update_accounts(accounts, accounts_params) do
      render(conn, "show.json", accounts: accounts)
    end
  end

  def delete(conn, %{"id" => id}) do
    accounts = Main.get_accounts!(id)

    with {:ok, %Accounts{}} <- Main.delete_accounts(accounts) do
      send_resp(conn, :no_content, "")
    end
  end
end
