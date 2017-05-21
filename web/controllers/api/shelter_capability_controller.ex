defmodule Backend.Api.ShelterCapabilityController do
  use Backend.Web, :controller

  alias Backend.ShelterCapability

  def index(conn, _params) do
    shelter_capabilities = Repo.all(ShelterCapability)
    render(conn, "index.json", scs: shelter_capabilities)
  end

  def show(conn, %{"id" => id}) do
    shelter_capability = Repo.get!(ShelterCapability, id)
    render(conn, "show.json", sc: shelter_capability)
  end

end
