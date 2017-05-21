defmodule Backend.Api.EducationServiceView do
  use Backend.Web, :view

  def render("index.json", %{ess: ess}) do
    %{data: render_many(ess, Backend.Api.EducationServiceView, "education_service.json")}
  end

  def render("show.json", %{es: es}) do
    %{data: render_one(es, Backend.Api.EducationServiceView, "education_service.json")}
  end

  def render("education_service.json", %{education_service: es}) do
    %{name: es.name, description: es.description, id: es.id}
  end
end
