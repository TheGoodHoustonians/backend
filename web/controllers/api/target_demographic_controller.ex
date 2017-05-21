defmodule Backend.Api.TargetDemographicController do
  use Backend.Web, :controller

  alias Backend.TargetDemographic

  def index(conn, _params) do
    target_demographics = Repo.all(TargetDemographic)
    render(conn, "index.html", tds: target_demographics)
  end

  def show(conn, %{"id" => id}) do
    target_demographic = Repo.get!(TargetDemographic, id)
    render(conn, "show.html", td: target_demographic)
  end

end
