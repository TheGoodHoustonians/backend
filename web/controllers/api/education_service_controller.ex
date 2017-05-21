defmodule Backend.EducationServiceController do
  use Backend.Web, :controller

  alias Backend.EducationService

  def index(conn, _params) do
    education_services = Repo.all(EducationService)
    render(conn, "index.html", education_services: education_services)
  end

  def new(conn, _params) do
    changeset = EducationService.changeset(%EducationService{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"education_service" => education_service_params}) do
    changeset = EducationService.changeset(%EducationService{}, education_service_params)

    case Repo.insert(changeset) do
      {:ok, _education_service} ->
        conn
        |> put_flash(:info, "Education service created successfully.")
        |> redirect(to: education_service_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    education_service = Repo.get!(EducationService, id)
    render(conn, "show.html", education_service: education_service)
  end

  def edit(conn, %{"id" => id}) do
    education_service = Repo.get!(EducationService, id)
    changeset = EducationService.changeset(education_service)
    render(conn, "edit.html", education_service: education_service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "education_service" => education_service_params}) do
    education_service = Repo.get!(EducationService, id)
    changeset = EducationService.changeset(education_service, education_service_params)

    case Repo.update(changeset) do
      {:ok, education_service} ->
        conn
        |> put_flash(:info, "Education service updated successfully.")
        |> redirect(to: education_service_path(conn, :show, education_service))
      {:error, changeset} ->
        render(conn, "edit.html", education_service: education_service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    education_service = Repo.get!(EducationService, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(education_service)

    conn
    |> put_flash(:info, "Education service deleted successfully.")
    |> redirect(to: education_service_path(conn, :index))
  end
end
