defmodule CbsWeb.DepositView do
  use CbsWeb, :view
  alias CbsWeb.DepositView

  def render("index.json", %{deposits: deposits}) do
    %{data: render_many(deposits, DepositView, "deposit.json")}
  end

  def render("show.json", %{deposit: deposit}) do
    %{data: render_one(deposit, DepositView, "deposit.json")}
  end

  def render("deposit.json", %{deposit: deposit}) do
    %{id: deposit.id,
      amount: deposit.amount}
  end
end
