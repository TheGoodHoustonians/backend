defmodule Backend.Repo.Migrations.CreateTransportationAssistance do
  use Ecto.Migration

  def change do
    create table(:transportation_assistances) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
