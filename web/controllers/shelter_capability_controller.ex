defmodule Backend.ShelterCapabilityController do
  use Backend.Web, :controller

  alias Backend.ShelterCapability

  def index(conn, _params) do
    shelter_capabilities = Repo.all(ShelterCapability)
    render(conn, "index.html", shelter_capabilities: shelter_capabilities)
  end

  def new(conn, _params) do
    changeset = ShelterCapability.changeset(%ShelterCapability{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"shelter_capability" => shelter_capability_params}) do
    changeset = ShelterCapability.changeset(%ShelterCapability{}, shelter_capability_params)

    case Repo.insert(changeset) do
      {:ok, _shelter_capability} ->
        conn
        |> put_flash(:info, "Shelter capability created successfully.")
        |> redirect(to: shelter_capability_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shelter_capability = Repo.get!(ShelterCapability, id)
    render(conn, "show.html", shelter_capability: shelter_capability)
  end

  def edit(conn, %{"id" => id}) do
    shelter_capability = Repo.get!(ShelterCapability, id)
    changeset = ShelterCapability.changeset(shelter_capability)
    render(conn, "edit.html", shelter_capability: shelter_capability, changeset: changeset)
  end

  def update(conn, %{"id" => id, "shelter_capability" => shelter_capability_params}) do
    shelter_capability = Repo.get!(ShelterCapability, id)
    changeset = ShelterCapability.changeset(shelter_capability, shelter_capability_params)

    case Repo.update(changeset) do
      {:ok, shelter_capability} ->
        conn
        |> put_flash(:info, "Shelter capability updated successfully.")
        |> redirect(to: shelter_capability_path(conn, :show, shelter_capability))
      {:error, changeset} ->
        render(conn, "edit.html", shelter_capability: shelter_capability, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shelter_capability = Repo.get!(ShelterCapability, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(shelter_capability)

    conn
    |> put_flash(:info, "Shelter capability deleted successfully.")
    |> redirect(to: shelter_capability_path(conn, :index))
  end
end
