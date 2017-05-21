defmodule Backend.Api.SubstanceAbuseTreatmentView do
  use Backend.Web, :view

  def render("index.json", %{sats: sats}) do
    %{data: render_many(sats, Backend.Api.SubstanceAbuseTreatmentView, "substance_abuse_treatment.json")}
  end

  def render("show.json", %{sat: sat}) do
    %{data: render_one(sat, Backend.Api.SubstanceAbuseTreatmentView, "substance_abuse_treatment.json")}
  end

  def render("substance_abuse_treatment.json", %{substance_abuse_treatment: sat}) do
    %{name: sat.name, description: sat.description, id: sat.id}
  end
end
