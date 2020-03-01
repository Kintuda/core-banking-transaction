defmodule CbsWeb.WithdrawalControllerTest do
  use CbsWeb.ConnCase

  alias Cbs.Main
  alias Cbs.Main.Withdrawal

  @create_attrs %{
    amount: "120.5"
  }
  @update_attrs %{
    amount: "456.7"
  }
  @invalid_attrs %{amount: nil}

  def fixture(:withdrawal) do
    {:ok, withdrawal} = Main.create_withdrawal(@create_attrs)
    withdrawal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all withdrawals", %{conn: conn} do
      conn = get(conn, Routes.withdrawal_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create withdrawal" do
    test "renders withdrawal when data is valid", %{conn: conn} do
      conn = post(conn, Routes.withdrawal_path(conn, :create), withdrawal: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.withdrawal_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.withdrawal_path(conn, :create), withdrawal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update withdrawal" do
    setup [:create_withdrawal]

    test "renders withdrawal when data is valid", %{conn: conn, withdrawal: %Withdrawal{id: id} = withdrawal} do
      conn = put(conn, Routes.withdrawal_path(conn, :update, withdrawal), withdrawal: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.withdrawal_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, withdrawal: withdrawal} do
      conn = put(conn, Routes.withdrawal_path(conn, :update, withdrawal), withdrawal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete withdrawal" do
    setup [:create_withdrawal]

    test "deletes chosen withdrawal", %{conn: conn, withdrawal: withdrawal} do
      conn = delete(conn, Routes.withdrawal_path(conn, :delete, withdrawal))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.withdrawal_path(conn, :show, withdrawal))
      end
    end
  end

  defp create_withdrawal(_) do
    withdrawal = fixture(:withdrawal)
    {:ok, withdrawal: withdrawal}
  end
end
