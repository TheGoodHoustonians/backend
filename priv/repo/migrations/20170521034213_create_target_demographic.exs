defmodule Backend.Repo.Migrations.CreateTargetDemographic do
  use Ecto.Migration

  def change do
    create table(:target_demographics) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
