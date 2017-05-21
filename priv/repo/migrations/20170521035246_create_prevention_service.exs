defmodule Backend.Repo.Migrations.CreatePreventionService do
  use Ecto.Migration

  def change do
    create table(:prevention_services) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
