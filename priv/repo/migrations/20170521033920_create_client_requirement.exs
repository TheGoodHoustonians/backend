defmodule Backend.Repo.Migrations.CreateClientRequirement do
  use Ecto.Migration

  def change do
    create table(:client_requirements) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
