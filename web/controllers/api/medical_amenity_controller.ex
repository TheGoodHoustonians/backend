defmodule Backend.MedicalAmenityController do
  use Backend.Web, :controller

  alias Backend.MedicalAmenity

  def index(conn, _params) do
    medical_amenities = Repo.all(MedicalAmenity)
    render(conn, "index.html", medical_amenities: medical_amenities)
  end

  def new(conn, _params) do
    changeset = MedicalAmenity.changeset(%MedicalAmenity{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"medical_amenity" => medical_amenity_params}) do
    changeset = MedicalAmenity.changeset(%MedicalAmenity{}, medical_amenity_params)

    case Repo.insert(changeset) do
      {:ok, _medical_amenity} ->
        conn
        |> put_flash(:info, "Medical amenity created successfully.")
        |> redirect(to: medical_amenity_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    medical_amenity = Repo.get!(MedicalAmenity, id)
    render(conn, "show.html", medical_amenity: medical_amenity)
  end

  def edit(conn, %{"id" => id}) do
    medical_amenity = Repo.get!(MedicalAmenity, id)
    changeset = MedicalAmenity.changeset(medical_amenity)
    render(conn, "edit.html", medical_amenity: medical_amenity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "medical_amenity" => medical_amenity_params}) do
    medical_amenity = Repo.get!(MedicalAmenity, id)
    changeset = MedicalAmenity.changeset(medical_amenity, medical_amenity_params)

    case Repo.update(changeset) do
      {:ok, medical_amenity} ->
        conn
        |> put_flash(:info, "Medical amenity updated successfully.")
        |> redirect(to: medical_amenity_path(conn, :show, medical_amenity))
      {:error, changeset} ->
        render(conn, "edit.html", medical_amenity: medical_amenity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    medical_amenity = Repo.get!(MedicalAmenity, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(medical_amenity)

    conn
    |> put_flash(:info, "Medical amenity deleted successfully.")
    |> redirect(to: medical_amenity_path(conn, :index))
  end
end
