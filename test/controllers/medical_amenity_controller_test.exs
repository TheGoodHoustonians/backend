defmodule Backend.MedicalAmenityControllerTest do
  use Backend.ConnCase

  alias Backend.MedicalAmenity
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, medical_amenity_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing medical amenities"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, medical_amenity_path(conn, :new)
    assert html_response(conn, 200) =~ "New medical amenity"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, medical_amenity_path(conn, :create), medical_amenity: @valid_attrs
    assert redirected_to(conn) == medical_amenity_path(conn, :index)
    assert Repo.get_by(MedicalAmenity, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, medical_amenity_path(conn, :create), medical_amenity: @invalid_attrs
    assert html_response(conn, 200) =~ "New medical amenity"
  end

  test "shows chosen resource", %{conn: conn} do
    medical_amenity = Repo.insert! %MedicalAmenity{}
    conn = get conn, medical_amenity_path(conn, :show, medical_amenity)
    assert html_response(conn, 200) =~ "Show medical amenity"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, medical_amenity_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    medical_amenity = Repo.insert! %MedicalAmenity{}
    conn = get conn, medical_amenity_path(conn, :edit, medical_amenity)
    assert html_response(conn, 200) =~ "Edit medical amenity"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    medical_amenity = Repo.insert! %MedicalAmenity{}
    conn = put conn, medical_amenity_path(conn, :update, medical_amenity), medical_amenity: @valid_attrs
    assert redirected_to(conn) == medical_amenity_path(conn, :show, medical_amenity)
    assert Repo.get_by(MedicalAmenity, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    medical_amenity = Repo.insert! %MedicalAmenity{}
    conn = put conn, medical_amenity_path(conn, :update, medical_amenity), medical_amenity: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit medical amenity"
  end

  test "deletes chosen resource", %{conn: conn} do
    medical_amenity = Repo.insert! %MedicalAmenity{}
    conn = delete conn, medical_amenity_path(conn, :delete, medical_amenity)
    assert redirected_to(conn) == medical_amenity_path(conn, :index)
    refute Repo.get(MedicalAmenity, medical_amenity.id)
  end
end
