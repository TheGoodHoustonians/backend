defmodule Backend.Api.ServiceController do
  use Backend.Web, :controller

  alias Backend.Service

  def index(conn, _params) do
    services = Repo.all(Service)
    render(conn, "index.json", ss: services)
  end

  def show(conn, %{"id" => id}) do
    service = Repo.get!(Service, id)
    render(conn, "show.json", s: service)
  end
end
