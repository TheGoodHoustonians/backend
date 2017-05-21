defmodule Backend.EducationSupportController do
  use Backend.Web, :controller

  alias Backend.EducationSupport

  def index(conn, _params) do
    education_supports = Repo.all(EducationSupport)
    render(conn, "index.html", education_supports: education_supports)
  end

  def new(conn, _params) do
    changeset = EducationSupport.changeset(%EducationSupport{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"education_support" => education_support_params}) do
    changeset = EducationSupport.changeset(%EducationSupport{}, education_support_params)

    case Repo.insert(changeset) do
      {:ok, _education_support} ->
        conn
        |> put_flash(:info, "Education support created successfully.")
        |> redirect(to: education_support_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    education_support = Repo.get!(EducationSupport, id)
    render(conn, "show.html", education_support: education_support)
  end

  def edit(conn, %{"id" => id}) do
    education_support = Repo.get!(EducationSupport, id)
    changeset = EducationSupport.changeset(education_support)
    render(conn, "edit.html", education_support: education_support, changeset: changeset)
  end

  def update(conn, %{"id" => id, "education_support" => education_support_params}) do
    education_support = Repo.get!(EducationSupport, id)
    changeset = EducationSupport.changeset(education_support, education_support_params)

    case Repo.update(changeset) do
      {:ok, education_support} ->
        conn
        |> put_flash(:info, "Education support updated successfully.")
        |> redirect(to: education_support_path(conn, :show, education_support))
      {:error, changeset} ->
        render(conn, "edit.html", education_support: education_support, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    education_support = Repo.get!(EducationSupport, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(education_support)

    conn
    |> put_flash(:info, "Education support deleted successfully.")
    |> redirect(to: education_support_path(conn, :index))
  end
end
