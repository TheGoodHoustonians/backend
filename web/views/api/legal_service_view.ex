defmodule Backend.Api.LegalServiceView do
  use Backend.Web, :view

  def render("index.json", %{lss: lss}) do
    %{data: render_many(lss, Backend.Api.LegalServiceView, "legal_service.json")}
  end

  def render("show.json", %{ls: ls}) do
    %{data: render_one(ls, Backend.Api.LegalServiceView, "legal_service.json")}
  end

  def render("legal_service.json", %{ls: ls}) do
    ls
  end
end
