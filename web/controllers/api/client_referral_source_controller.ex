defmodule Backend.Api.ClientReferralSourceController do
  use Backend.Web, :controller

  alias Backend.ClientReferralSource

  def index(conn, _params) do
    client_referral_sourcs = Repo.all(ClientReferralSource)
    render(conn, "index.json", crss: client_referral_sourcs)
  end

  def show(conn, %{"id" => id}) do
    client_referral_source = Repo.get!(ClientReferralSource, id)
    render(conn, "show.json", crs: client_referral_source)
  end
end
