defmodule Backend.EducationSupportTest do
  use Backend.ModelCase

  alias Backend.EducationSupport

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = EducationSupport.changeset(%EducationSupport{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = EducationSupport.changeset(%EducationSupport{}, @invalid_attrs)
    refute changeset.valid?
  end
end
