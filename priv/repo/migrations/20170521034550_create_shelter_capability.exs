defmodule Backend.Repo.Migrations.CreateShelterCapability do
  use Ecto.Migration

  def change do
    create table(:shelter_capabilities) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
