defmodule Backend.Api.SubstanceAbuseTreatmentController do
  use Backend.Web, :controller

  alias Backend.SubstanceAbuseTreatment

  def index(conn, _params) do
    substance_abuse_treatments = Repo.all(SubstanceAbuseTreatment)
    render(conn, "index.json", sats: substance_abuse_treatments)
  end

  def show(conn, %{"id" => id}) do
    substance_abuse_treatment = Repo.get!(SubstanceAbuseTreatment, id)
    render(conn, "show.json", sat: substance_abuse_treatment)
  end

end
