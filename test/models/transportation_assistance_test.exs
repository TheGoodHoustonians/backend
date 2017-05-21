defmodule Backend.TransportationAssistanceTest do
  use Backend.ModelCase

  alias Backend.TransportationAssistance

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = TransportationAssistance.changeset(%TransportationAssistance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = TransportationAssistance.changeset(%TransportationAssistance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
