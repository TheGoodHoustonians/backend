defmodule Backend.Repo.Migrations.CreateService do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
