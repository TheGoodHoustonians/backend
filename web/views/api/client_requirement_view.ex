defmodule Backend.Api.ClientRequirementView do
  use Backend.Web, :view

  def render("index.json", %{crs: crs}) do
    %{data: render_many(crs, Backend.Api.ClientRequirementView, "client_requirement.json")}
  end

  def render("show.json", %{cr: cr}) do
    %{data: render_one(cr, Backend.Api.ClientRequirementView, "client_requirement.json")}
  end

  def render("client_requirement.json", %{crs: crs}) do
    crs
  end
end