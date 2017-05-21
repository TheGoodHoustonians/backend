defmodule Backend.Api.ServiceView do
  use Backend.Web, :view

  def render("index.json", %{ss: ss}) do
    %{data: render_many(ss, Backend.Api.ServiceView, "service.json")}
  end

  def render("show.json", %{s: s}) do
    %{data: render_one(s, Backend.Api.ServiceView, "service.json")}
  end

  def render("service.json", %{service: s}) do
    %{name: s.name, description: s.description, id: s.id}
  end

end
