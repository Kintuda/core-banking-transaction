defmodule Cbs.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :description, :string
      add :routing_number, :uuid
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

  end
end
