defmodule CbsWeb.AdressControllerTest do
  use CbsWeb.ConnCase

  alias Cbs.Main
  alias Cbs.Main.Adress

  @create_attrs %{
    county: "some county",
    ibge_code: "some ibge_code",
    neighborhood: "some neighborhood",
    state: "some state",
    street: "some street",
    zipcode: "some zipcode"
  }
  @update_attrs %{
    county: "some updated county",
    ibge_code: "some updated ibge_code",
    neighborhood: "some updated neighborhood",
    state: "some updated state",
    street: "some updated street",
    zipcode: "some updated zipcode"
  }
  @invalid_attrs %{county: nil, ibge_code: nil, neighborhood: nil, state: nil, street: nil, zipcode: nil}

  def fixture(:adress) do
    {:ok, adress} = Main.create_adress(@create_attrs)
    adress
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all adresses", %{conn: conn} do
      conn = get(conn, Routes.adress_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create adress" do
    test "renders adress when data is valid", %{conn: conn} do
      conn = post(conn, Routes.adress_path(conn, :create), adress: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.adress_path(conn, :show, id))

      assert %{
               "id" => id,
               "county" => "some county",
               "ibge_code" => "some ibge_code",
               "neighborhood" => "some neighborhood",
               "state" => "some state",
               "street" => "some street",
               "zipcode" => "some zipcode"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.adress_path(conn, :create), adress: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update adress" do
    setup [:create_adress]

    test "renders adress when data is valid", %{conn: conn, adress: %Adress{id: id} = adress} do
      conn = put(conn, Routes.adress_path(conn, :update, adress), adress: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.adress_path(conn, :show, id))

      assert %{
               "id" => id,
               "county" => "some updated county",
               "ibge_code" => "some updated ibge_code",
               "neighborhood" => "some updated neighborhood",
               "state" => "some updated state",
               "street" => "some updated street",
               "zipcode" => "some updated zipcode"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, adress: adress} do
      conn = put(conn, Routes.adress_path(conn, :update, adress), adress: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete adress" do
    setup [:create_adress]

    test "deletes chosen adress", %{conn: conn, adress: adress} do
      conn = delete(conn, Routes.adress_path(conn, :delete, adress))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.adress_path(conn, :show, adress))
      end
    end
  end

  defp create_adress(_) do
    adress = fixture(:adress)
    {:ok, adress: adress}
  end
end
