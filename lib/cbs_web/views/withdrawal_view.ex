defmodule CbsWeb.WithdrawalView do
  use CbsWeb, :view
  alias CbsWeb.WithdrawalView

  def render("index.json", %{withdrawals: withdrawals}) do
    %{data: render_many(withdrawals, WithdrawalView, "withdrawal.json")}
  end

  def render("show.json", %{withdrawal: withdrawal}) do
    %{data: render_one(withdrawal, WithdrawalView, "withdrawal.json")}
  end

  def render("withdrawal.json", %{withdrawal: withdrawal}) do
    %{id: withdrawal.id,
      amount: withdrawal.amount}
  end
end
