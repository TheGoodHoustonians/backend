defmodule Backend.Repo.Migrations.CreateEducationSupport do
  use Ecto.Migration

  def change do
    create table(:education_supports) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
