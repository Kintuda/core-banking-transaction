defmodule Cbs.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute("CREATE TYPE user_status AS ENUM ('ACTIVE', 'INACTIVE', 'DELETED')")
    create table(:users) do
      add :first_name, :string, size: 120, null: false
      add :last_name, :string, size: 120, null: false
      add :username, :string, size: 120, null: false
      add :password, :string, size: 256, null: false
      add :email, :string, size: 120, null: false
      add :status, :user_status, null: false, default: "ACTIVE"

      timestamps()
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
  end
end
