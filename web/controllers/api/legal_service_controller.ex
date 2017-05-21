defmodule Backend.LegalServiceController do
  use Backend.Web, :controller

  alias Backend.LegalService

  def index(conn, _params) do
    legal_services = Repo.all(LegalService)
    render(conn, "index.html", legal_services: legal_services)
  end

  def new(conn, _params) do
    changeset = LegalService.changeset(%LegalService{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"legal_service" => legal_service_params}) do
    changeset = LegalService.changeset(%LegalService{}, legal_service_params)

    case Repo.insert(changeset) do
      {:ok, _legal_service} ->
        conn
        |> put_flash(:info, "Legal service created successfully.")
        |> redirect(to: legal_service_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    legal_service = Repo.get!(LegalService, id)
    render(conn, "show.html", legal_service: legal_service)
  end

  def edit(conn, %{"id" => id}) do
    legal_service = Repo.get!(LegalService, id)
    changeset = LegalService.changeset(legal_service)
    render(conn, "edit.html", legal_service: legal_service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "legal_service" => legal_service_params}) do
    legal_service = Repo.get!(LegalService, id)
    changeset = LegalService.changeset(legal_service, legal_service_params)

    case Repo.update(changeset) do
      {:ok, legal_service} ->
        conn
        |> put_flash(:info, "Legal service updated successfully.")
        |> redirect(to: legal_service_path(conn, :show, legal_service))
      {:error, changeset} ->
        render(conn, "edit.html", legal_service: legal_service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    legal_service = Repo.get!(LegalService, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(legal_service)

    conn
    |> put_flash(:info, "Legal service deleted successfully.")
    |> redirect(to: legal_service_path(conn, :index))
  end
end
