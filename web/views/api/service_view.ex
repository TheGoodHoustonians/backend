defmodule Backend.Api.ServiceView do
  use Backend.Web, :view
  def render("index.json", %{ss: ss}) do
    %{data: render_many(ss, Backend.Api.ServiceView, "service.json")}
  end

  def render("show.json", %{s: s}) do
    %{data: render_one(s, Backend.Api.ServiceView, "service.json")}
  end

  def render("service.json", %{s: s}) do
    s
  end
end
