defmodule Backend.PreventionServiceTest do
  use Backend.ModelCase

  alias Backend.PreventionService

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PreventionService.changeset(%PreventionService{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PreventionService.changeset(%PreventionService{}, @invalid_attrs)
    refute changeset.valid?
  end
end
