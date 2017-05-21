defmodule Backend.Api.ClientReferralSourceView do
  use Backend.Web, :view

  def render("index.json", %{crss: crss}) do
    %{data: render_many(crss, Backend.Api.ClientReferralSourceView, "client_referral_source.json")}
  end

  def render("show.json", %{crs: crs}) do
    %{data: render_one(crs, Backend.Api.ClientReferralSourceView, "client_referral_source.json")}
  end

  def render("client_referral_source.json", %{client_referral_source: crs}) do
    %{name: crs.name, description: crs.description, id: crs.id}
  end
end