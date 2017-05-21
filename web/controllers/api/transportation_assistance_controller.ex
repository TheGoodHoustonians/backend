defmodule Backend.Api.TransportationAssistanceController do
  use Backend.Web, :controller

  alias Backend.TransportationAssistance

  def index(conn, _params) do
    transportation_assistances = Repo.all(TransportationAssistance)
    render(conn, "index.json", tas: transportation_assistances)
  end

  def show(conn, %{"id" => id}) do
    transportation_assistance = Repo.get!(TransportationAssistance, id)
    render(conn, "show.json", ta: transportation_assistance)
  end

end
