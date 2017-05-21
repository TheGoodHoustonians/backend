defmodule Backend.PreventionServiceControllerTest do
  use Backend.ConnCase

  alias Backend.PreventionService
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, prevention_service_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing prevention services"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, prevention_service_path(conn, :new)
    assert html_response(conn, 200) =~ "New prevention service"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, prevention_service_path(conn, :create), prevention_service: @valid_attrs
    assert redirected_to(conn) == prevention_service_path(conn, :index)
    assert Repo.get_by(PreventionService, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, prevention_service_path(conn, :create), prevention_service: @invalid_attrs
    assert html_response(conn, 200) =~ "New prevention service"
  end

  test "shows chosen resource", %{conn: conn} do
    prevention_service = Repo.insert! %PreventionService{}
    conn = get conn, prevention_service_path(conn, :show, prevention_service)
    assert html_response(conn, 200) =~ "Show prevention service"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, prevention_service_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    prevention_service = Repo.insert! %PreventionService{}
    conn = get conn, prevention_service_path(conn, :edit, prevention_service)
    assert html_response(conn, 200) =~ "Edit prevention service"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    prevention_service = Repo.insert! %PreventionService{}
    conn = put conn, prevention_service_path(conn, :update, prevention_service), prevention_service: @valid_attrs
    assert redirected_to(conn) == prevention_service_path(conn, :show, prevention_service)
    assert Repo.get_by(PreventionService, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    prevention_service = Repo.insert! %PreventionService{}
    conn = put conn, prevention_service_path(conn, :update, prevention_service), prevention_service: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit prevention service"
  end

  test "deletes chosen resource", %{conn: conn} do
    prevention_service = Repo.insert! %PreventionService{}
    conn = delete conn, prevention_service_path(conn, :delete, prevention_service)
    assert redirected_to(conn) == prevention_service_path(conn, :index)
    refute Repo.get(PreventionService, prevention_service.id)
  end
end
