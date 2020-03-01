defmodule CbsWeb.WithdrawalController do
  use CbsWeb, :controller

  alias Cbs.Main
  alias Cbs.Main.Withdrawal

  action_fallback CbsWeb.FallbackController

  def index(conn, _params) do
    withdrawals = Main.list_withdrawals()
    render(conn, "index.json", withdrawals: withdrawals)
  end

  def create(conn, %{"withdrawal" => withdrawal_params}) do
    with {:ok, %Withdrawal{} = withdrawal} <- Main.create_withdrawal(withdrawal_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.withdrawal_path(conn, :show, withdrawal))
      |> render("show.json", withdrawal: withdrawal)
    end
  end

  def show(conn, %{"id" => id}) do
    withdrawal = Main.get_withdrawal!(id)
    render(conn, "show.json", withdrawal: withdrawal)
  end

  def update(conn, %{"id" => id, "withdrawal" => withdrawal_params}) do
    withdrawal = Main.get_withdrawal!(id)

    with {:ok, %Withdrawal{} = withdrawal} <- Main.update_withdrawal(withdrawal, withdrawal_params) do
      render(conn, "show.json", withdrawal: withdrawal)
    end
  end

  def delete(conn, %{"id" => id}) do
    withdrawal = Main.get_withdrawal!(id)

    with {:ok, %Withdrawal{}} <- Main.delete_withdrawal(withdrawal) do
      send_resp(conn, :no_content, "")
    end
  end
end
