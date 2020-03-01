defmodule CbsWeb.DepositController do
  use CbsWeb, :controller

  alias Cbs.Main
  alias Cbs.Main.Deposit

  action_fallback CbsWeb.FallbackController

  def index(conn, _params) do
    deposits = Main.list_deposits()
    render(conn, "index.json", deposits: deposits)
  end

  def create(conn, %{"deposit" => deposit_params}) do
    with {:ok, %Deposit{} = deposit} <- Main.create_deposit(deposit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.deposit_path(conn, :show, deposit))
      |> render("show.json", deposit: deposit)
    end
  end

  def show(conn, %{"id" => id}) do
    deposit = Main.get_deposit!(id)
    render(conn, "show.json", deposit: deposit)
  end

  def update(conn, %{"id" => id, "deposit" => deposit_params}) do
    deposit = Main.get_deposit!(id)

    with {:ok, %Deposit{} = deposit} <- Main.update_deposit(deposit, deposit_params) do
      render(conn, "show.json", deposit: deposit)
    end
  end

  def delete(conn, %{"id" => id}) do
    deposit = Main.get_deposit!(id)

    with {:ok, %Deposit{}} <- Main.delete_deposit(deposit) do
      send_resp(conn, :no_content, "")
    end
  end
end
