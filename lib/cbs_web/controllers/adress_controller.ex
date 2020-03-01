defmodule CbsWeb.AdressController do
  use CbsWeb, :controller

  alias Cbs.Main
  alias Cbs.Main.Adress

  action_fallback CbsWeb.FallbackController

  def index(conn, _params) do
    adresses = Main.list_adresses()
    render(conn, "index.json", adresses: adresses)
  end

  def create(conn, %{"adress" => adress_params}) do
    with {:ok, %Adress{} = adress} <- Main.create_adress(adress_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.adress_path(conn, :show, adress))
      |> render("show.json", adress: adress)
    end
  end

  def show(conn, %{"id" => id}) do
    adress = Main.get_adress!(id)
    render(conn, "show.json", adress: adress)
  end

  def update(conn, %{"id" => id, "adress" => adress_params}) do
    adress = Main.get_adress!(id)

    with {:ok, %Adress{} = adress} <- Main.update_adress(adress, adress_params) do
      render(conn, "show.json", adress: adress)
    end
  end

  def delete(conn, %{"id" => id}) do
    adress = Main.get_adress!(id)

    with {:ok, %Adress{}} <- Main.delete_adress(adress) do
      send_resp(conn, :no_content, "")
    end
  end
end
