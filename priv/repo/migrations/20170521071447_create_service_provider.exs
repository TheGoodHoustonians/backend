defmodule Backend.Repo.Migrations.CreateServiceProvider do
  use Ecto.Migration

  def change do
    create table(:service_providers) do
      add :organization_name, :string
      add :contact_name, :string
      add :website, :string
      add :contact_phone, :string
      add :email, :string
      add :languages, {:array, :string}
      add :hotline_phone, :string

      timestamps()
    end

  end
end
