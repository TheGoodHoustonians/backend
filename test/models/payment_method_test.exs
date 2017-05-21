defmodule Backend.PaymentMethodTest do
  use Backend.ModelCase

  alias Backend.PaymentMethod

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PaymentMethod.changeset(%PaymentMethod{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PaymentMethod.changeset(%PaymentMethod{}, @invalid_attrs)
    refute changeset.valid?
  end
end
