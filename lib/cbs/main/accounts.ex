defmodule Cbs.Main.Accounts do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :description, :string
    field :routing_number, :binary_id
    # belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(accounts, attrs) do
    accounts
    |> cast(attrs, [:description, :routing_number])
    |> validate_required([:description, :routing_number])
  end
end
