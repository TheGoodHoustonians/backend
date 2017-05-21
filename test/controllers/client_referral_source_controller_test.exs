defmodule Backend.ClientReferralSourceControllerTest do
  use Backend.ConnCase

  alias Backend.ClientReferralSource
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, client_referral_source_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing client referral sourcs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, client_referral_source_path(conn, :new)
    assert html_response(conn, 200) =~ "New client referral source"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, client_referral_source_path(conn, :create), client_referral_source: @valid_attrs
    assert redirected_to(conn) == client_referral_source_path(conn, :index)
    assert Repo.get_by(ClientReferralSource, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, client_referral_source_path(conn, :create), client_referral_source: @invalid_attrs
    assert html_response(conn, 200) =~ "New client referral source"
  end

  test "shows chosen resource", %{conn: conn} do
    client_referral_source = Repo.insert! %ClientReferralSource{}
    conn = get conn, client_referral_source_path(conn, :show, client_referral_source)
    assert html_response(conn, 200) =~ "Show client referral source"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, client_referral_source_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    client_referral_source = Repo.insert! %ClientReferralSource{}
    conn = get conn, client_referral_source_path(conn, :edit, client_referral_source)
    assert html_response(conn, 200) =~ "Edit client referral source"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    client_referral_source = Repo.insert! %ClientReferralSource{}
    conn = put conn, client_referral_source_path(conn, :update, client_referral_source), client_referral_source: @valid_attrs
    assert redirected_to(conn) == client_referral_source_path(conn, :show, client_referral_source)
    assert Repo.get_by(ClientReferralSource, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    client_referral_source = Repo.insert! %ClientReferralSource{}
    conn = put conn, client_referral_source_path(conn, :update, client_referral_source), client_referral_source: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit client referral source"
  end

  test "deletes chosen resource", %{conn: conn} do
    client_referral_source = Repo.insert! %ClientReferralSource{}
    conn = delete conn, client_referral_source_path(conn, :delete, client_referral_source)
    assert redirected_to(conn) == client_referral_source_path(conn, :index)
    refute Repo.get(ClientReferralSource, client_referral_source.id)
  end
end
