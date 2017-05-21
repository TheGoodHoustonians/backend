defmodule Backend.Api.ServiceProviderController do
  use Backend.Web, :controller

  alias Backend.ServiceProvider

  def index(conn, _params) do
    service_providers = Repo.all(ServiceProvider)
    render(conn, "index.json", sps: service_providers)
  end

  def show(conn, %{"id" => id}) do
    service_provider = Repo.get!(ServiceProvider, id)
    render(conn, "show.json", sp: service_provider)
  end

end
