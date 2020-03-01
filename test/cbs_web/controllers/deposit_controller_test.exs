defmodule CbsWeb.DepositControllerTest do
  use CbsWeb.ConnCase

  alias Cbs.Main
  alias Cbs.Main.Deposit

  @create_attrs %{
    amount: "120.5"
  }
  @update_attrs %{
    amount: "456.7"
  }
  @invalid_attrs %{amount: nil}

  def fixture(:deposit) do
    {:ok, deposit} = Main.create_deposit(@create_attrs)
    deposit
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all deposits", %{conn: conn} do
      conn = get(conn, Routes.deposit_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create deposit" do
    test "renders deposit when data is valid", %{conn: conn} do
      conn = post(conn, Routes.deposit_path(conn, :create), deposit: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.deposit_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.deposit_path(conn, :create), deposit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update deposit" do
    setup [:create_deposit]

    test "renders deposit when data is valid", %{conn: conn, deposit: %Deposit{id: id} = deposit} do
      conn = put(conn, Routes.deposit_path(conn, :update, deposit), deposit: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.deposit_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, deposit: deposit} do
      conn = put(conn, Routes.deposit_path(conn, :update, deposit), deposit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete deposit" do
    setup [:create_deposit]

    test "deletes chosen deposit", %{conn: conn, deposit: deposit} do
      conn = delete(conn, Routes.deposit_path(conn, :delete, deposit))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.deposit_path(conn, :show, deposit))
      end
    end
  end

  defp create_deposit(_) do
    deposit = fixture(:deposit)
    {:ok, deposit: deposit}
  end
end
