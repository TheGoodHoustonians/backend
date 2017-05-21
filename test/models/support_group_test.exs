defmodule Backend.SupportGroupTest do
  use Backend.ModelCase

  alias Backend.SupportGroup

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SupportGroup.changeset(%SupportGroup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SupportGroup.changeset(%SupportGroup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
