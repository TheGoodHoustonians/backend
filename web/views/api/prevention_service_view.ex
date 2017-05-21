defmodule Backend.Api.PreventionServiceView do
  use Backend.Web, :view

  def render("index.json", %{pss: pss}) do
    %{data: render_many(pss, Backend.Api.PreventionServiceView, "prevention_service.json")}
  end

  def render("show.json", %{ps: ps}) do
    %{data: render_one(ps, Backend.Api.PreventionServiceView, "prevention_service.json")}
  end

  def render("prevention_service.json", %{prevention_service: ps}) do
    %{name: ps.name, description: ps.description, id: ps.id}
  end
end
