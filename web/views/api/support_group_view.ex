defmodule Backend.Api.SupportGroupView do
  use Backend.Web, :view

  def render("index.json", %{sgs: sgs}) do
    %{data: render_many(sgs, Backend.Api.SupportGroupView, "support_group.json")}
  end

  def render("show.json", %{sg: sg}) do
    %{data: render_one(sg, Backend.Api.SupportGroupView, "support_group.json")}
  end

  def render("support_group.json", %{support_group: sg}) do
    %{name: sg.name, description: sg.description, id: sg.id}
  end
end
