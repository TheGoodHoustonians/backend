defmodule Backend.EducationServiceControllerTest do
  use Backend.ConnCase

  alias Backend.EducationService
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, education_service_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing education services"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, education_service_path(conn, :new)
    assert html_response(conn, 200) =~ "New education service"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, education_service_path(conn, :create), education_service: @valid_attrs
    assert redirected_to(conn) == education_service_path(conn, :index)
    assert Repo.get_by(EducationService, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, education_service_path(conn, :create), education_service: @invalid_attrs
    assert html_response(conn, 200) =~ "New education service"
  end

  test "shows chosen resource", %{conn: conn} do
    education_service = Repo.insert! %EducationService{}
    conn = get conn, education_service_path(conn, :show, education_service)
    assert html_response(conn, 200) =~ "Show education service"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, education_service_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    education_service = Repo.insert! %EducationService{}
    conn = get conn, education_service_path(conn, :edit, education_service)
    assert html_response(conn, 200) =~ "Edit education service"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    education_service = Repo.insert! %EducationService{}
    conn = put conn, education_service_path(conn, :update, education_service), education_service: @valid_attrs
    assert redirected_to(conn) == education_service_path(conn, :show, education_service)
    assert Repo.get_by(EducationService, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    education_service = Repo.insert! %EducationService{}
    conn = put conn, education_service_path(conn, :update, education_service), education_service: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit education service"
  end

  test "deletes chosen resource", %{conn: conn} do
    education_service = Repo.insert! %EducationService{}
    conn = delete conn, education_service_path(conn, :delete, education_service)
    assert redirected_to(conn) == education_service_path(conn, :index)
    refute Repo.get(EducationService, education_service.id)
  end
end
