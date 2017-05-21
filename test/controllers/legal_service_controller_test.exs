defmodule Backend.LegalServiceControllerTest do
  use Backend.ConnCase

  alias Backend.LegalService
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, legal_service_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing legal services"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, legal_service_path(conn, :new)
    assert html_response(conn, 200) =~ "New legal service"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, legal_service_path(conn, :create), legal_service: @valid_attrs
    assert redirected_to(conn) == legal_service_path(conn, :index)
    assert Repo.get_by(LegalService, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, legal_service_path(conn, :create), legal_service: @invalid_attrs
    assert html_response(conn, 200) =~ "New legal service"
  end

  test "shows chosen resource", %{conn: conn} do
    legal_service = Repo.insert! %LegalService{}
    conn = get conn, legal_service_path(conn, :show, legal_service)
    assert html_response(conn, 200) =~ "Show legal service"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, legal_service_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    legal_service = Repo.insert! %LegalService{}
    conn = get conn, legal_service_path(conn, :edit, legal_service)
    assert html_response(conn, 200) =~ "Edit legal service"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    legal_service = Repo.insert! %LegalService{}
    conn = put conn, legal_service_path(conn, :update, legal_service), legal_service: @valid_attrs
    assert redirected_to(conn) == legal_service_path(conn, :show, legal_service)
    assert Repo.get_by(LegalService, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    legal_service = Repo.insert! %LegalService{}
    conn = put conn, legal_service_path(conn, :update, legal_service), legal_service: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit legal service"
  end

  test "deletes chosen resource", %{conn: conn} do
    legal_service = Repo.insert! %LegalService{}
    conn = delete conn, legal_service_path(conn, :delete, legal_service)
    assert redirected_to(conn) == legal_service_path(conn, :index)
    refute Repo.get(LegalService, legal_service.id)
  end
end
