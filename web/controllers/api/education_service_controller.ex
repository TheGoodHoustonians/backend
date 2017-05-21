defmodule Backend.Api.EducationServiceController do
  use Backend.Web, :controller

  alias Backend.EducationService

  def index(conn, _params) do
    education_services = Repo.all(EducationService)
    render(conn, "index.json", ess: education_services)
  end

  def show(conn, %{"id" => id}) do
    education_service = Repo.get!(EducationService, id)
    render(conn, "show.json", es: education_service)
  end

end
