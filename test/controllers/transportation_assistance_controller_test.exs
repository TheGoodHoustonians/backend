defmodule Backend.TransportationAssistanceControllerTest do
  use Backend.ConnCase

  alias Backend.TransportationAssistance
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, transportation_assistance_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing transportation assistances"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, transportation_assistance_path(conn, :new)
    assert html_response(conn, 200) =~ "New transportation assistance"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, transportation_assistance_path(conn, :create), transportation_assistance: @valid_attrs
    assert redirected_to(conn) == transportation_assistance_path(conn, :index)
    assert Repo.get_by(TransportationAssistance, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, transportation_assistance_path(conn, :create), transportation_assistance: @invalid_attrs
    assert html_response(conn, 200) =~ "New transportation assistance"
  end

  test "shows chosen resource", %{conn: conn} do
    transportation_assistance = Repo.insert! %TransportationAssistance{}
    conn = get conn, transportation_assistance_path(conn, :show, transportation_assistance)
    assert html_response(conn, 200) =~ "Show transportation assistance"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, transportation_assistance_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    transportation_assistance = Repo.insert! %TransportationAssistance{}
    conn = get conn, transportation_assistance_path(conn, :edit, transportation_assistance)
    assert html_response(conn, 200) =~ "Edit transportation assistance"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    transportation_assistance = Repo.insert! %TransportationAssistance{}
    conn = put conn, transportation_assistance_path(conn, :update, transportation_assistance), transportation_assistance: @valid_attrs
    assert redirected_to(conn) == transportation_assistance_path(conn, :show, transportation_assistance)
    assert Repo.get_by(TransportationAssistance, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    transportation_assistance = Repo.insert! %TransportationAssistance{}
    conn = put conn, transportation_assistance_path(conn, :update, transportation_assistance), transportation_assistance: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit transportation assistance"
  end

  test "deletes chosen resource", %{conn: conn} do
    transportation_assistance = Repo.insert! %TransportationAssistance{}
    conn = delete conn, transportation_assistance_path(conn, :delete, transportation_assistance)
    assert redirected_to(conn) == transportation_assistance_path(conn, :index)
    refute Repo.get(TransportationAssistance, transportation_assistance.id)
  end
end
