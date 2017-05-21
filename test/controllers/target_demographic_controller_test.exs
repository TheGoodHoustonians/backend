defmodule Backend.TargetDemographicControllerTest do
  use Backend.ConnCase

  alias Backend.TargetDemographic
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, target_demographic_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing target demographics"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, target_demographic_path(conn, :new)
    assert html_response(conn, 200) =~ "New target demographic"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, target_demographic_path(conn, :create), target_demographic: @valid_attrs
    assert redirected_to(conn) == target_demographic_path(conn, :index)
    assert Repo.get_by(TargetDemographic, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, target_demographic_path(conn, :create), target_demographic: @invalid_attrs
    assert html_response(conn, 200) =~ "New target demographic"
  end

  test "shows chosen resource", %{conn: conn} do
    target_demographic = Repo.insert! %TargetDemographic{}
    conn = get conn, target_demographic_path(conn, :show, target_demographic)
    assert html_response(conn, 200) =~ "Show target demographic"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, target_demographic_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    target_demographic = Repo.insert! %TargetDemographic{}
    conn = get conn, target_demographic_path(conn, :edit, target_demographic)
    assert html_response(conn, 200) =~ "Edit target demographic"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    target_demographic = Repo.insert! %TargetDemographic{}
    conn = put conn, target_demographic_path(conn, :update, target_demographic), target_demographic: @valid_attrs
    assert redirected_to(conn) == target_demographic_path(conn, :show, target_demographic)
    assert Repo.get_by(TargetDemographic, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    target_demographic = Repo.insert! %TargetDemographic{}
    conn = put conn, target_demographic_path(conn, :update, target_demographic), target_demographic: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit target demographic"
  end

  test "deletes chosen resource", %{conn: conn} do
    target_demographic = Repo.insert! %TargetDemographic{}
    conn = delete conn, target_demographic_path(conn, :delete, target_demographic)
    assert redirected_to(conn) == target_demographic_path(conn, :index)
    refute Repo.get(TargetDemographic, target_demographic.id)
  end
end
