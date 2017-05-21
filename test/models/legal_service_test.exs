defmodule Backend.LegalServiceTest do
  use Backend.ModelCase

  alias Backend.LegalService

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = LegalService.changeset(%LegalService{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = LegalService.changeset(%LegalService{}, @invalid_attrs)
    refute changeset.valid?
  end
end
