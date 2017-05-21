defmodule Backend.TargetDemographicTest do
  use Backend.ModelCase

  alias Backend.TargetDemographic

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TargetDemographic.changeset(%TargetDemographic{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TargetDemographic.changeset(%TargetDemographic{}, @invalid_attrs)
    refute changeset.valid?
  end
end
