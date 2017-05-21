defmodule Backend.ClientReferralSourceController do
  use Backend.Web, :controller

  alias Backend.ClientReferralSource

  def index(conn, _params) do
    client_referral_sourcs = Repo.all(ClientReferralSource)
    render(conn, "index.html", client_referral_sourcs: client_referral_sourcs)
  end

  def new(conn, _params) do
    changeset = ClientReferralSource.changeset(%ClientReferralSource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"client_referral_source" => client_referral_source_params}) do
    changeset = ClientReferralSource.changeset(%ClientReferralSource{}, client_referral_source_params)

    case Repo.insert(changeset) do
      {:ok, _client_referral_source} ->
        conn
        |> put_flash(:info, "Client referral source created successfully.")
        |> redirect(to: client_referral_source_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client_referral_source = Repo.get!(ClientReferralSource, id)
    render(conn, "show.html", client_referral_source: client_referral_source)
  end

  def edit(conn, %{"id" => id}) do
    client_referral_source = Repo.get!(ClientReferralSource, id)
    changeset = ClientReferralSource.changeset(client_referral_source)
    render(conn, "edit.html", client_referral_source: client_referral_source, changeset: changeset)
  end

  def update(conn, %{"id" => id, "client_referral_source" => client_referral_source_params}) do
    client_referral_source = Repo.get!(ClientReferralSource, id)
    changeset = ClientReferralSource.changeset(client_referral_source, client_referral_source_params)

    case Repo.update(changeset) do
      {:ok, client_referral_source} ->
        conn
        |> put_flash(:info, "Client referral source updated successfully.")
        |> redirect(to: client_referral_source_path(conn, :show, client_referral_source))
      {:error, changeset} ->
        render(conn, "edit.html", client_referral_source: client_referral_source, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_referral_source = Repo.get!(ClientReferralSource, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(client_referral_source)

    conn
    |> put_flash(:info, "Client referral source deleted successfully.")
    |> redirect(to: client_referral_source_path(conn, :index))
  end
end
