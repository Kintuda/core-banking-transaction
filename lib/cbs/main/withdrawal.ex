defmodule Cbs.Main.Withdrawal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "withdrawals" do
    field :amount, :decimal
    field :account_id, :id

    timestamps()
  end

  @doc false
  def changeset(withdrawal, attrs) do
    withdrawal
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
