defmodule Backend.Repo.Migrations.CreateOutreachProgram do
  use Ecto.Migration

  def change do
    create table(:outreach_programs) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
