defmodule Backend.User do
  use Backend.Web, :model

  schema "users" do
    field :display_name, :string
    field :hashed_password, :string
    field :email, :string

    timestamps()
  end

  @required_fields ~w( display_name email hashed_password )

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> unique_constraint( :email )
    |> validate_required([:display_name, :email])
  end
end
