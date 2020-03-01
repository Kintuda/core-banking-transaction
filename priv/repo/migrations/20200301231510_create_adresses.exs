defmodule Cbs.Repo.Migrations.CreateAdresses do
  use Ecto.Migration

  def change do
    create table(:adresses) do
      add :zipcode, :string, size: 8
      add :street, :string, size: 256
      add :ibge_code, :string, size: 12
      add :state, :string, size: 256
      add :county, :string, size: 256
      add :neighborhood, :string, size: 256
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:adresses, [:user_id])
  end
end
