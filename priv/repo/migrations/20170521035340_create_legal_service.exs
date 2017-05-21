defmodule Backend.Repo.Migrations.CreateLegalService do
  use Ecto.Migration

  def change do
    create table(:legal_services) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
