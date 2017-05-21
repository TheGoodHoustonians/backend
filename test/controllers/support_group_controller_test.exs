defmodule Backend.SupportGroupControllerTest do
  use Backend.ConnCase

  alias Backend.SupportGroup
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, support_group_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing support groups"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, support_group_path(conn, :new)
    assert html_response(conn, 200) =~ "New support group"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, support_group_path(conn, :create), support_group: @valid_attrs
    assert redirected_to(conn) == support_group_path(conn, :index)
    assert Repo.get_by(SupportGroup, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, support_group_path(conn, :create), support_group: @invalid_attrs
    assert html_response(conn, 200) =~ "New support group"
  end

  test "shows chosen resource", %{conn: conn} do
    support_group = Repo.insert! %SupportGroup{}
    conn = get conn, support_group_path(conn, :show, support_group)
    assert html_response(conn, 200) =~ "Show support group"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, support_group_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    support_group = Repo.insert! %SupportGroup{}
    conn = get conn, support_group_path(conn, :edit, support_group)
    assert html_response(conn, 200) =~ "Edit support group"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    support_group = Repo.insert! %SupportGroup{}
    conn = put conn, support_group_path(conn, :update, support_group), support_group: @valid_attrs
    assert redirected_to(conn) == support_group_path(conn, :show, support_group)
    assert Repo.get_by(SupportGroup, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    support_group = Repo.insert! %SupportGroup{}
    conn = put conn, support_group_path(conn, :update, support_group), support_group: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit support group"
  end

  test "deletes chosen resource", %{conn: conn} do
    support_group = Repo.insert! %SupportGroup{}
    conn = delete conn, support_group_path(conn, :delete, support_group)
    assert redirected_to(conn) == support_group_path(conn, :index)
    refute Repo.get(SupportGroup, support_group.id)
  end
end
