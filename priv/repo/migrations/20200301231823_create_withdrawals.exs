defmodule Cbs.Repo.Migrations.CreateWithdrawals do
  use Ecto.Migration

  def change do
    create table(:withdrawals) do
      add :amount, :decimal
      add :account_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end

    create index(:withdrawals, [:account_id])
  end
end
