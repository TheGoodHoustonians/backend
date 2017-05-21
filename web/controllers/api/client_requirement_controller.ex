defmodule Backend.Api.ClientRequirementController do
  use Backend.Web, :controller

  alias Backend.ClientRequirement

  def index(conn, _params) do
    client_requirements = Repo.all(ClientRequirement)
    render(conn, "index.json", crs: client_requirements)
  end

  def show(conn, %{"id" => id}) do
    client_requirement = Repo.get!(ClientRequirement, id)
    render(conn, "show.json", cr: client_requirement)
  end
end
