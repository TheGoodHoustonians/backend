defmodule Backend.SubstanceAbuseTreatmentControllerTest do
  use Backend.ConnCase

  alias Backend.SubstanceAbuseTreatment
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, substance_abuse_treatment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing substance abuse treatments"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, substance_abuse_treatment_path(conn, :new)
    assert html_response(conn, 200) =~ "New substance abuse treatment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, substance_abuse_treatment_path(conn, :create), substance_abuse_treatment: @valid_attrs
    assert redirected_to(conn) == substance_abuse_treatment_path(conn, :index)
    assert Repo.get_by(SubstanceAbuseTreatment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, substance_abuse_treatment_path(conn, :create), substance_abuse_treatment: @invalid_attrs
    assert html_response(conn, 200) =~ "New substance abuse treatment"
  end

  test "shows chosen resource", %{conn: conn} do
    substance_abuse_treatment = Repo.insert! %SubstanceAbuseTreatment{}
    conn = get conn, substance_abuse_treatment_path(conn, :show, substance_abuse_treatment)
    assert html_response(conn, 200) =~ "Show substance abuse treatment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, substance_abuse_treatment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    substance_abuse_treatment = Repo.insert! %SubstanceAbuseTreatment{}
    conn = get conn, substance_abuse_treatment_path(conn, :edit, substance_abuse_treatment)
    assert html_response(conn, 200) =~ "Edit substance abuse treatment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    substance_abuse_treatment = Repo.insert! %SubstanceAbuseTreatment{}
    conn = put conn, substance_abuse_treatment_path(conn, :update, substance_abuse_treatment), substance_abuse_treatment: @valid_attrs
    assert redirected_to(conn) == substance_abuse_treatment_path(conn, :show, substance_abuse_treatment)
    assert Repo.get_by(SubstanceAbuseTreatment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    substance_abuse_treatment = Repo.insert! %SubstanceAbuseTreatment{}
    conn = put conn, substance_abuse_treatment_path(conn, :update, substance_abuse_treatment), substance_abuse_treatment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit substance abuse treatment"
  end

  test "deletes chosen resource", %{conn: conn} do
    substance_abuse_treatment = Repo.insert! %SubstanceAbuseTreatment{}
    conn = delete conn, substance_abuse_treatment_path(conn, :delete, substance_abuse_treatment)
    assert redirected_to(conn) == substance_abuse_treatment_path(conn, :index)
    refute Repo.get(SubstanceAbuseTreatment, substance_abuse_treatment.id)
  end
end
