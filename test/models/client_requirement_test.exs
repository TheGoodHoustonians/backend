defmodule Backend.ClientRequirementTest do
  use Backend.ModelCase

  alias Backend.ClientRequirement

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ClientRequirement.changeset(%ClientRequirement{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ClientRequirement.changeset(%ClientRequirement{}, @invalid_attrs)
    refute changeset.valid?
  end
end
