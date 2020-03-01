defmodule Cbs.Main.Adress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "adresses" do
    field :county, :string
    field :ibge_code, :string
    field :neighborhood, :string
    field :state, :string
    field :street, :string
    field :zipcode, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(adress, attrs) do
    adress
    |> cast(attrs, [:zipcode, :street, :ibge_code, :state, :county, :neighborhood])
    |> validate_required([:zipcode, :street, :ibge_code, :state, :county, :neighborhood])
  end
end
