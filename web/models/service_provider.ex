defmodule Backend.ServiceProvider do
  use Backend.Web, :model

  schema "service_providers" do
    field :organization_name, :string
    field :contact_name, :string
    field :website, :string
    field :contact_phone, :string
    field :email, :string
    field :languages, {:array, :string}
    field :hotline_phone, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:organization_name, :contact_name, :website, :contact_phone, :email, :hotline_phone])
    |> validate_required([:organization_name, :contact_name, :website, :contact_phone, :email, :hotline_phone])
  end
end
