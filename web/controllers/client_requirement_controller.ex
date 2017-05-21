defmodule Backend.ClientRequirementController do
  use Backend.Web, :controller

  alias Backend.ClientRequirement

  def index(conn, _params) do
    client_requirements = Repo.all(ClientRequirement)
    render(conn, "index.html", client_requirements: client_requirements)
  end

  def new(conn, _params) do
    changeset = ClientRequirement.changeset(%ClientRequirement{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"client_requirement" => client_requirement_params}) do
    changeset = ClientRequirement.changeset(%ClientRequirement{}, client_requirement_params)

    case Repo.insert(changeset) do
      {:ok, _client_requirement} ->
        conn
        |> put_flash(:info, "Client requirement created successfully.")
        |> redirect(to: client_requirement_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    client_requirement = Repo.get!(ClientRequirement, id)
    render(conn, "show.html", client_requirement: client_requirement)
  end

  def edit(conn, %{"id" => id}) do
    client_requirement = Repo.get!(ClientRequirement, id)
    changeset = ClientRequirement.changeset(client_requirement)
    render(conn, "edit.html", client_requirement: client_requirement, changeset: changeset)
  end

  def update(conn, %{"id" => id, "client_requirement" => client_requirement_params}) do
    client_requirement = Repo.get!(ClientRequirement, id)
    changeset = ClientRequirement.changeset(client_requirement, client_requirement_params)

    case Repo.update(changeset) do
      {:ok, client_requirement} ->
        conn
        |> put_flash(:info, "Client requirement updated successfully.")
        |> redirect(to: client_requirement_path(conn, :show, client_requirement))
      {:error, changeset} ->
        render(conn, "edit.html", client_requirement: client_requirement, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    client_requirement = Repo.get!(ClientRequirement, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(client_requirement)

    conn
    |> put_flash(:info, "Client requirement deleted successfully.")
    |> redirect(to: client_requirement_path(conn, :index))
  end
end
