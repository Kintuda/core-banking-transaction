defmodule Cbs.Main.Deposit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "deposits" do
    field :amount, :decimal
    field :account_id, :id

    timestamps()
  end

  @doc false
  def changeset(deposit, attrs) do
    deposit
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
