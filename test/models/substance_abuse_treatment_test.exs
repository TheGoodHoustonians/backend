defmodule Backend.SubstanceAbuseTreatmentTest do
  use Backend.ModelCase

  alias Backend.SubstanceAbuseTreatment

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SubstanceAbuseTreatment.changeset(%SubstanceAbuseTreatment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SubstanceAbuseTreatment.changeset(%SubstanceAbuseTreatment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
