defmodule CbsWeb.AdressView do
  use CbsWeb, :view
  alias CbsWeb.AdressView

  def render("index.json", %{adresses: adresses}) do
    %{data: render_many(adresses, AdressView, "adress.json")}
  end

  def render("show.json", %{adress: adress}) do
    %{data: render_one(adress, AdressView, "adress.json")}
  end

  def render("adress.json", %{adress: adress}) do
    %{id: adress.id,
      zipcode: adress.zipcode,
      street: adress.street,
      ibge_code: adress.ibge_code,
      state: adress.state,
      county: adress.county,
      neighborhood: adress.neighborhood}
  end
end
