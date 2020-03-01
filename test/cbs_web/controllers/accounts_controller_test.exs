defmodule CbsWeb.AccountsControllerTest do
  use CbsWeb.ConnCase

  alias Cbs.Main
  alias Cbs.Main.Accounts

  @create_attrs %{
    description: "some description",
    routing_number: "some routing_number"
  }
  @update_attrs %{
    description: "some updated description",
    routing_number: "some updated routing_number"
  }
  @invalid_attrs %{description: nil, routing_number: nil}

  def fixture(:accounts) do
    {:ok, accounts} = Main.create_accounts(@create_attrs)
    accounts
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all accounts", %{conn: conn} do
      conn = get(conn, Routes.accounts_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create accounts" do
    test "renders accounts when data is valid", %{conn: conn} do
      conn = post(conn, Routes.accounts_path(conn, :create), accounts: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.accounts_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "routing_number" => "some routing_number"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.accounts_path(conn, :create), accounts: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update accounts" do
    setup [:create_accounts]

    test "renders accounts when data is valid", %{conn: conn, accounts: %Accounts{id: id} = accounts} do
      conn = put(conn, Routes.accounts_path(conn, :update, accounts), accounts: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.accounts_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "routing_number" => "some updated routing_number"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, accounts: accounts} do
      conn = put(conn, Routes.accounts_path(conn, :update, accounts), accounts: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete accounts" do
    setup [:create_accounts]

    test "deletes chosen accounts", %{conn: conn, accounts: accounts} do
      conn = delete(conn, Routes.accounts_path(conn, :delete, accounts))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.accounts_path(conn, :show, accounts))
      end
    end
  end

  defp create_accounts(_) do
    accounts = fixture(:accounts)
    {:ok, accounts: accounts}
  end
end
