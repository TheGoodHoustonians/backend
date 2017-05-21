defmodule Backend.Api.ClientReferralSourceView do
  use Backend.Web, :view

  def render("index.json", %{crss: crss}) do
    %{data: render_many(crss, Backend.Api.ClientReferralSourceView, "client_referral_source.json")}
  end

  def render("show.json", %{crs: crs}) do
    %{data: render_one(crs, Backend.Api.ClientReferralSourceView, "client_referral_source.json")}
  end

  def render("client_referral_source.json", %{crs: crs}) do
    crs
  end
end