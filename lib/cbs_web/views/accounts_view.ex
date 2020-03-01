defmodule CbsWeb.AccountsView do
  use CbsWeb, :view
  alias CbsWeb.AccountsView

  def render("index.json", %{accounts: accounts}) do
    %{data: render_many(accounts, AccountsView, "accounts.json")}
  end

  def render("show.json", %{accounts: accounts}) do
    %{data: render_one(accounts, AccountsView, "accounts.json")}
  end

  def render("accounts.json", %{accounts: accounts}) do
    %{id: accounts.id,
      description: accounts.description,
      routing_number: accounts.routing_number}
  end
end
