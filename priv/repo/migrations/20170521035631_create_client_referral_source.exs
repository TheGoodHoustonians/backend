defmodule Backend.Repo.Migrations.CreateClientReferralSource do
  use Ecto.Migration

  def change do
    create table(:client_referral_sourcs) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
