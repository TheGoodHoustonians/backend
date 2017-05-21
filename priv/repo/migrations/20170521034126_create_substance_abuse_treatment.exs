defmodule Backend.Repo.Migrations.CreateSubstanceAbuseTreatment do
  use Ecto.Migration

  def change do
    create table(:substance_abuse_treatments) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
