defmodule Backend.ServiceProviderControllerTest do
  use Backend.ConnCase

  alias Backend.ServiceProvider
  @valid_attrs %{contact_name: "some content", contact_phone: "some content", email: "some content", hotline_phone: "some content", languages: [], organization_name: "some content", website: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, service_provider_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing service providers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, service_provider_path(conn, :new)
    assert html_response(conn, 200) =~ "New service provider"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, service_provider_path(conn, :create), service_provider: @valid_attrs
    assert redirected_to(conn) == service_provider_path(conn, :index)
    assert Repo.get_by(ServiceProvider, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, service_provider_path(conn, :create), service_provider: @invalid_attrs
    assert html_response(conn, 200) =~ "New service provider"
  end

  test "shows chosen resource", %{conn: conn} do
    service_provider = Repo.insert! %ServiceProvider{}
    conn = get conn, service_provider_path(conn, :show, service_provider)
    assert html_response(conn, 200) =~ "Show service provider"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, service_provider_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    service_provider = Repo.insert! %ServiceProvider{}
    conn = get conn, service_provider_path(conn, :edit, service_provider)
    assert html_response(conn, 200) =~ "Edit service provider"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    service_provider = Repo.insert! %ServiceProvider{}
    conn = put conn, service_provider_path(conn, :update, service_provider), service_provider: @valid_attrs
    assert redirected_to(conn) == service_provider_path(conn, :show, service_provider)
    assert Repo.get_by(ServiceProvider, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    service_provider = Repo.insert! %ServiceProvider{}
    conn = put conn, service_provider_path(conn, :update, service_provider), service_provider: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit service provider"
  end

  test "deletes chosen resource", %{conn: conn} do
    service_provider = Repo.insert! %ServiceProvider{}
    conn = delete conn, service_provider_path(conn, :delete, service_provider)
    assert redirected_to(conn) == service_provider_path(conn, :index)
    refute Repo.get(ServiceProvider, service_provider.id)
  end
end
