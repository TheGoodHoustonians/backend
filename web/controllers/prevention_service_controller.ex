defmodule Backend.PreventionServiceController do
  use Backend.Web, :controller

  alias Backend.PreventionService

  def index(conn, _params) do
    prevention_services = Repo.all(PreventionService)
    render(conn, "index.html", prevention_services: prevention_services)
  end

  def new(conn, _params) do
    changeset = PreventionService.changeset(%PreventionService{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"prevention_service" => prevention_service_params}) do
    changeset = PreventionService.changeset(%PreventionService{}, prevention_service_params)

    case Repo.insert(changeset) do
      {:ok, _prevention_service} ->
        conn
        |> put_flash(:info, "Prevention service created successfully.")
        |> redirect(to: prevention_service_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    prevention_service = Repo.get!(PreventionService, id)
    render(conn, "show.html", prevention_service: prevention_service)
  end

  def edit(conn, %{"id" => id}) do
    prevention_service = Repo.get!(PreventionService, id)
    changeset = PreventionService.changeset(prevention_service)
    render(conn, "edit.html", prevention_service: prevention_service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "prevention_service" => prevention_service_params}) do
    prevention_service = Repo.get!(PreventionService, id)
    changeset = PreventionService.changeset(prevention_service, prevention_service_params)

    case Repo.update(changeset) do
      {:ok, prevention_service} ->
        conn
        |> put_flash(:info, "Prevention service updated successfully.")
        |> redirect(to: prevention_service_path(conn, :show, prevention_service))
      {:error, changeset} ->
        render(conn, "edit.html", prevention_service: prevention_service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    prevention_service = Repo.get!(PreventionService, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(prevention_service)

    conn
    |> put_flash(:info, "Prevention service deleted successfully.")
    |> redirect(to: prevention_service_path(conn, :index))
  end
end
