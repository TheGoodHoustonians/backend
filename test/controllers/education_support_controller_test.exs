defmodule Backend.EducationSupportControllerTest do
  use Backend.ConnCase

  alias Backend.EducationSupport
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, education_support_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing education supports"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, education_support_path(conn, :new)
    assert html_response(conn, 200) =~ "New education support"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, education_support_path(conn, :create), education_support: @valid_attrs
    assert redirected_to(conn) == education_support_path(conn, :index)
    assert Repo.get_by(EducationSupport, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, education_support_path(conn, :create), education_support: @invalid_attrs
    assert html_response(conn, 200) =~ "New education support"
  end

  test "shows chosen resource", %{conn: conn} do
    education_support = Repo.insert! %EducationSupport{}
    conn = get conn, education_support_path(conn, :show, education_support)
    assert html_response(conn, 200) =~ "Show education support"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, education_support_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    education_support = Repo.insert! %EducationSupport{}
    conn = get conn, education_support_path(conn, :edit, education_support)
    assert html_response(conn, 200) =~ "Edit education support"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    education_support = Repo.insert! %EducationSupport{}
    conn = put conn, education_support_path(conn, :update, education_support), education_support: @valid_attrs
    assert redirected_to(conn) == education_support_path(conn, :show, education_support)
    assert Repo.get_by(EducationSupport, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    education_support = Repo.insert! %EducationSupport{}
    conn = put conn, education_support_path(conn, :update, education_support), education_support: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit education support"
  end

  test "deletes chosen resource", %{conn: conn} do
    education_support = Repo.insert! %EducationSupport{}
    conn = delete conn, education_support_path(conn, :delete, education_support)
    assert redirected_to(conn) == education_support_path(conn, :index)
    refute Repo.get(EducationSupport, education_support.id)
  end
end
