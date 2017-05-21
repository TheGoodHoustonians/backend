defmodule Backend.Api.PreventionServiceController do
  use Backend.Web, :controller

  alias Backend.PreventionService

  def index(conn, _params) do
    prevention_services = Repo.all(PreventionService)
    render(conn, "index.json", pss: prevention_services)
  end

  def show(conn, %{"id" => id}) do
    prevention_service = Repo.get!(PreventionService, id)
    render(conn, "show.json", ps: prevention_service)
  end

end
