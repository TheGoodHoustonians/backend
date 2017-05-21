defmodule Backend.Repo.Migrations.CreateEducationService do
  use Ecto.Migration

  def change do
    create table(:education_services) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
