defmodule Backend.OutreachProgramTest do
  use Backend.ModelCase

  alias Backend.OutreachProgram

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = OutreachProgram.changeset(%OutreachProgram{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = OutreachProgram.changeset(%OutreachProgram{}, @invalid_attrs)
    refute changeset.valid?
  end
end
