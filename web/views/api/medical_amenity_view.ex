defmodule Backend.Api.MedicalAmenityView do
  use Backend.Web, :view

  def render("index.json", %{mas: mas}) do
    %{data: render_many(mas, Backend.Api.MedicalAmenityView, "medical_amenity.json")}
  end

  def render("show.json", %{ma: ma}) do
    %{data: render_one(ma, Backend.Api.MedicalAmenityView, "medical_amenity.json")}
  end

  def render("medical_amenity.json", %{medical_amenity: ma}) do
     %{name: ma.name, description: ma.description, id: ma.id}
  end
end
