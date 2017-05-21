defmodule Backend.ClientReferralSourceTest do
  use Backend.ModelCase

  alias Backend.ClientReferralSource

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ClientReferralSource.changeset(%ClientReferralSource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ClientReferralSource.changeset(%ClientReferralSource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
