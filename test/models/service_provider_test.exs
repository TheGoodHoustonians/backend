defmodule Backend.ServiceProviderTest do
  use Backend.ModelCase

  alias Backend.ServiceProvider

  @valid_attrs %{contact_name: "some content", contact_phone: "some content", email: "some content", hotline_phone: "some content", languages: [], organization_name: "some content", website: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ServiceProvider.changeset(%ServiceProvider{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ServiceProvider.changeset(%ServiceProvider{}, @invalid_attrs)
    refute changeset.valid?
  end
end
