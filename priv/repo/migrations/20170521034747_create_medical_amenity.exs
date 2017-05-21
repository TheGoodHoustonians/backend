defmodule Backend.Repo.Migrations.CreateMedicalAmenity do
  use Ecto.Migration

  def change do
    create table(:medical_amenities) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
