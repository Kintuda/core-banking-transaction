defmodule Cbs.Main.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
    field :username, :string
    field :status, :string, default: "ACTIVE"
    has_many :accounts, Accounts

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :username, :password, :email, :status])
    |> validate_required([:first_name, :last_name, :username, :password, :email])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
