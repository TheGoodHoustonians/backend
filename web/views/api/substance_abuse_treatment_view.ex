defmodule Backend.Api.SubstanceAbuseTreatmentView do
  use Backend.Web, :view

  def render("index.json", %{scs: scs}) do
    %{data: render_many(scs, Backend.Api.SubstanceAbuseTreatmentView, "shelter_capability.json")}
  end

  def render("show.json", %{sc: sc}) do
    %{data: render_one(sc, Backend.Api.SubstanceAbuseTreatmentView, "shelter_capability.json")}
  end

  def render("shelter_capability.json", %{sc: sc}) do
    sc
  end
end
