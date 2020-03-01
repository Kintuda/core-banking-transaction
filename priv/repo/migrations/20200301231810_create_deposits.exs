defmodule Cbs.Repo.Migrations.CreateDeposits do
  use Ecto.Migration

  def change do
    create table(:deposits) do
      add :amount, :decimal
      add :account_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end

    create index(:deposits, [:account_id])
  end
end
