defmodule Backend.TransportationAssistanceController do
  use Backend.Web, :controller

  alias Backend.TransportationAssistance

  def index(conn, _params) do
    transportation_assistances = Repo.all(TransportationAssistance)
    render(conn, "index.html", transportation_assistances: transportation_assistances)
  end

  def new(conn, _params) do
    changeset = TransportationAssistance.changeset(%TransportationAssistance{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"transportation_assistance" => transportation_assistance_params}) do
    changeset = TransportationAssistance.changeset(%TransportationAssistance{}, transportation_assistance_params)

    case Repo.insert(changeset) do
      {:ok, _transportation_assistance} ->
        conn
        |> put_flash(:info, "Transportation assistance created successfully.")
        |> redirect(to: transportation_assistance_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transportation_assistance = Repo.get!(TransportationAssistance, id)
    render(conn, "show.html", transportation_assistance: transportation_assistance)
  end

  def edit(conn, %{"id" => id}) do
    transportation_assistance = Repo.get!(TransportationAssistance, id)
    changeset = TransportationAssistance.changeset(transportation_assistance)
    render(conn, "edit.html", transportation_assistance: transportation_assistance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transportation_assistance" => transportation_assistance_params}) do
    transportation_assistance = Repo.get!(TransportationAssistance, id)
    changeset = TransportationAssistance.changeset(transportation_assistance, transportation_assistance_params)

    case Repo.update(changeset) do
      {:ok, transportation_assistance} ->
        conn
        |> put_flash(:info, "Transportation assistance updated successfully.")
        |> redirect(to: transportation_assistance_path(conn, :show, transportation_assistance))
      {:error, changeset} ->
        render(conn, "edit.html", transportation_assistance: transportation_assistance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    transportation_assistance = Repo.get!(TransportationAssistance, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(transportation_assistance)

    conn
    |> put_flash(:info, "Transportation assistance deleted successfully.")
    |> redirect(to: transportation_assistance_path(conn, :index))
  end
end
