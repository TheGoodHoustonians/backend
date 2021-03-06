defmodule Backend.Api.TransportationAssistanceView do
  use Backend.Web, :view

  def render("index.json", %{tas: tas}) do
    %{data: render_many(tas, Backend.Api.TransportationAssistanceView, "transportation_assistance.json")}
  end

  def render("show.json", %{ta: ta}) do
    %{data: render_one(ta, Backend.Api.TransportationAssistanceView, "transportation_assistance.json")}
  end

  def render("transportation_assistance.json", %{transportation_assistance: ta}) do
    %{name: ta.name, description: ta.description, id: ta.id}
  end
end
