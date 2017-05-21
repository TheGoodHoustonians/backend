defmodule Backend.TargetDemographicController do
  use Backend.Web, :controller

  alias Backend.TargetDemographic

  def index(conn, _params) do
    target_demographics = Repo.all(TargetDemographic)
    render(conn, "index.html", target_demographics: target_demographics)
  end

  def new(conn, _params) do
    changeset = TargetDemographic.changeset(%TargetDemographic{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"target_demographic" => target_demographic_params}) do
    changeset = TargetDemographic.changeset(%TargetDemographic{}, target_demographic_params)

    case Repo.insert(changeset) do
      {:ok, _target_demographic} ->
        conn
        |> put_flash(:info, "Target demographic created successfully.")
        |> redirect(to: target_demographic_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    target_demographic = Repo.get!(TargetDemographic, id)
    render(conn, "show.html", target_demographic: target_demographic)
  end

  def edit(conn, %{"id" => id}) do
    target_demographic = Repo.get!(TargetDemographic, id)
    changeset = TargetDemographic.changeset(target_demographic)
    render(conn, "edit.html", target_demographic: target_demographic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "target_demographic" => target_demographic_params}) do
    target_demographic = Repo.get!(TargetDemographic, id)
    changeset = TargetDemographic.changeset(target_demographic, target_demographic_params)

    case Repo.update(changeset) do
      {:ok, target_demographic} ->
        conn
        |> put_flash(:info, "Target demographic updated successfully.")
        |> redirect(to: target_demographic_path(conn, :show, target_demographic))
      {:error, changeset} ->
        render(conn, "edit.html", target_demographic: target_demographic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    target_demographic = Repo.get!(TargetDemographic, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(target_demographic)

    conn
    |> put_flash(:info, "Target demographic deleted successfully.")
    |> redirect(to: target_demographic_path(conn, :index))
  end
end
