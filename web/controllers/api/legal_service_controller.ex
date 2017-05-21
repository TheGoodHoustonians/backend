defmodule Backend.Api.LegalServiceController do
  use Backend.Web, :controller

  alias Backend.LegalService

  def index(conn, _params) do
    legal_services = Repo.all(LegalService)
    render(conn, "index.json", lss: legal_services)
  end

  def show(conn, %{"id" => id}) do
    legal_service = Repo.get!(LegalService, id)
    render(conn, "show.json", ls: legal_service)
  end
end
