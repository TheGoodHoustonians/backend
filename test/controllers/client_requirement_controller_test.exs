defmodule Backend.ClientRequirementControllerTest do
  use Backend.ConnCase

  alias Backend.ClientRequirement
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_requirement_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing client requirements"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, client_requirement_path(conn, :new)
    assert html_response(conn, 200) =~ "New client requirement"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, client_requirement_path(conn, :create), client_requirement: @valid_attrs
    assert redirected_to(conn) == client_requirement_path(conn, :index)
    assert Repo.get_by(ClientRequirement, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_requirement_path(conn, :create), client_requirement: @invalid_attrs
    assert html_response(conn, 200) =~ "New client requirement"
  end

  test "shows chosen resource", %{conn: conn} do
    client_requirement = Repo.insert! %ClientRequirement{}
    conn = get conn, client_requirement_path(conn, :show, client_requirement)
    assert html_response(conn, 200) =~ "Show client requirement"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_requirement_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    client_requirement = Repo.insert! %ClientRequirement{}
    conn = get conn, client_requirement_path(conn, :edit, client_requirement)
    assert html_response(conn, 200) =~ "Edit client requirement"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    client_requirement = Repo.insert! %ClientRequirement{}
    conn = put conn, client_requirement_path(conn, :update, client_requirement), client_requirement: @valid_attrs
    assert redirected_to(conn) == client_requirement_path(conn, :show, client_requirement)
    assert Repo.get_by(ClientRequirement, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client_requirement = Repo.insert! %ClientRequirement{}
    conn = put conn, client_requirement_path(conn, :update, client_requirement), client_requirement: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit client requirement"
  end

  test "deletes chosen resource", %{conn: conn} do
    client_requirement = Repo.insert! %ClientRequirement{}
    conn = delete conn, client_requirement_path(conn, :delete, client_requirement)
    assert redirected_to(conn) == client_requirement_path(conn, :index)
    refute Repo.get(ClientRequirement, client_requirement.id)
  end
end
