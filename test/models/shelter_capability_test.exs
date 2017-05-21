defmodule Backend.ShelterCapabilityTest do
  use Backend.ModelCase

  alias Backend.ShelterCapability

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ShelterCapability.changeset(%ShelterCapability{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ShelterCapability.changeset(%ShelterCapability{}, @invalid_attrs)
    refute changeset.valid?
  end
end
