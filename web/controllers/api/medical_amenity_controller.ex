defmodule Backend.Api.MedicalAmenityController do
  use Backend.Web, :controller

  alias Backend.MedicalAmenity

  def index(conn, _params) do
    medical_amenities = Repo.all(MedicalAmenity)
    render(conn, "index.json", mas: medical_amenities)
  end

  def show(conn, %{"id" => id}) do
    medical_amenity = Repo.get!(MedicalAmenity, id)
    render(conn, "show.json", ma: medical_amenity)
  end

end
