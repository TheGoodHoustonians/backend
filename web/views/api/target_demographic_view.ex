defmodule Backend.Api.TargetDemographicView do
  use Backend.Web, :view

  def render("index.json", %{tds: tds}) do
    %{data: render_many(tds, Backend.Api.TargetDemographicView, "target_demographic.json")}
  end

  def render("show.json", %{td: td}) do
    %{data: render_one(td, Backend.Api.TargetDemographicView, "target_demographic.json")}
  end

  def render("target_demographic.json", %{td: td}) do
    td
  end
end
