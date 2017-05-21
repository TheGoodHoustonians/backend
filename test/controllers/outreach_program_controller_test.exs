defmodule Backend.OutreachProgramControllerTest do
  use Backend.ConnCase

  alias Backend.OutreachProgram
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, outreach_program_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing outreach programs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, outreach_program_path(conn, :new)
    assert html_response(conn, 200) =~ "New outreach program"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, outreach_program_path(conn, :create), outreach_program: @valid_attrs
    assert redirected_to(conn) == outreach_program_path(conn, :index)
    assert Repo.get_by(OutreachProgram, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, outreach_program_path(conn, :create), outreach_program: @invalid_attrs
    assert html_response(conn, 200) =~ "New outreach program"
  end

  test "shows chosen resource", %{conn: conn} do
    outreach_program = Repo.insert! %OutreachProgram{}
    conn = get conn, outreach_program_path(conn, :show, outreach_program)
    assert html_response(conn, 200) =~ "Show outreach program"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, outreach_program_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    outreach_program = Repo.insert! %OutreachProgram{}
    conn = get conn, outreach_program_path(conn, :edit, outreach_program)
    assert html_response(conn, 200) =~ "Edit outreach program"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    outreach_program = Repo.insert! %OutreachProgram{}
    conn = put conn, outreach_program_path(conn, :update, outreach_program), outreach_program: @valid_attrs
    assert redirected_to(conn) == outreach_program_path(conn, :show, outreach_program)
    assert Repo.get_by(OutreachProgram, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    outreach_program = Repo.insert! %OutreachProgram{}
    conn = put conn, outreach_program_path(conn, :update, outreach_program), outreach_program: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit outreach program"
  end

  test "deletes chosen resource", %{conn: conn} do
    outreach_program = Repo.insert! %OutreachProgram{}
    conn = delete conn, outreach_program_path(conn, :delete, outreach_program)
    assert redirected_to(conn) == outreach_program_path(conn, :index)
    refute Repo.get(OutreachProgram, outreach_program.id)
  end
end
