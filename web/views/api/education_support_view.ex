defmodule Backend.Api.EducationSupportView do
  use Backend.Web, :view

  def render("index.json", %{esus: esus}) do
    %{data: render_many(esus, Backend.Api.EducationSupportView, "education_support.json")}
  end

  def render("show.json", %{esu: esu}) do
    %{data: render_one(esu, Backend.Api.EducationSupportView, "education_support.json")}
  end

  def render("education_support.json", %{education_support: esu}) do
    %{name: esu.name, description: esu.description, id: esu.id}
  end

end