defmodule Cbs.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :permissions, {:array, :string}
    field :role, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:role, :permissions])
    |> validate_required([:role, :permissions])
  end
end
