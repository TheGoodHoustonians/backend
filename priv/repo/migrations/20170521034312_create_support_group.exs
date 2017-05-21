defmodule Backend.Repo.Migrations.CreateSupportGroup do
  use Ecto.Migration

  def change do
    create table(:support_groups) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
