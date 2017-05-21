defmodule Backend.ShelterCapabilityControllerTest do
  use Backend.ConnCase

  alias Backend.ShelterCapability
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, shelter_capability_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing shelter capabilities"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, shelter_capability_path(conn, :new)
    assert html_response(conn, 200) =~ "New shelter capability"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, shelter_capability_path(conn, :create), shelter_capability: @valid_attrs
    assert redirected_to(conn) == shelter_capability_path(conn, :index)
    assert Repo.get_by(ShelterCapability, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, shelter_capability_path(conn, :create), shelter_capability: @invalid_attrs
    assert html_response(conn, 200) =~ "New shelter capability"
  end

  test "shows chosen resource", %{conn: conn} do
    shelter_capability = Repo.insert! %ShelterCapability{}
    conn = get conn, shelter_capability_path(conn, :show, shelter_capability)
    assert html_response(conn, 200) =~ "Show shelter capability"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, shelter_capability_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    shelter_capability = Repo.insert! %ShelterCapability{}
    conn = get conn, shelter_capability_path(conn, :edit, shelter_capability)
    assert html_response(conn, 200) =~ "Edit shelter capability"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    shelter_capability = Repo.insert! %ShelterCapability{}
    conn = put conn, shelter_capability_path(conn, :update, shelter_capability), shelter_capability: @valid_attrs
    assert redirected_to(conn) == shelter_capability_path(conn, :show, shelter_capability)
    assert Repo.get_by(ShelterCapability, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    shelter_capability = Repo.insert! %ShelterCapability{}
    conn = put conn, shelter_capability_path(conn, :update, shelter_capability), shelter_capability: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit shelter capability"
  end

  test "deletes chosen resource", %{conn: conn} do
    shelter_capability = Repo.insert! %ShelterCapability{}
    conn = delete conn, shelter_capability_path(conn, :delete, shelter_capability)
    assert redirected_to(conn) == shelter_capability_path(conn, :index)
    refute Repo.get(ShelterCapability, shelter_capability.id)
  end
end
