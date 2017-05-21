defmodule Backend.Api.SubstanceAbuseTreatmentView do
  use Backend.Web, :view

  def render("index.json", %{sats: sats}) do
    %{data: render_many(sats, Backend.Api.SubstanceAbuseTreatmentView, "shelter_capability.json")}
  end

  def render("show.json", %{sat: sat}) do
    %{data: render_one(sat, Backend.Api.SubstanceAbuseTreatmentView, "shelter_capability.json")}
  end

  def render("shelter_capability.json", %{sat: sat}) do
    sat
  end
end
