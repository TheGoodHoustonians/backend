defmodule Backend.Api.ServiceProviderView do
  use Backend.Web, :view

  def render("index.json", %{sps: sps}) do
    %{data: render_many(sps, Backend.Api.ServiceProviderView, "service_provider.json")}
  end

  def render("show.json", %{sp: sp}) do
    %{data: render_one(sp, Backend.Api.ServiceProviderView, "service_provider.json")}
  end

  def render("service_provider.json", %{service_provider: sp}) do
    %{
      organization_name: sp.organization_name,
      contact_name: sp.contact_name,
      website: sp.website,
      contact_phone: sp.contact_phone,
      email: sp.email,
      languages: sp.languages,
      hotline_phone: sp.hotline_phone
    }
  end
end
