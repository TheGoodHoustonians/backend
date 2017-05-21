defmodule Backend.Api.SupportGroupController do
  use Backend.Web, :controller

  alias Backend.SupportGroup

  def index(conn, _params) do
    support_groups = Repo.all(SupportGroup)
    render(conn, "index.json", sgs: support_groups)
  end

  def show(conn, %{"id" => id}) do
    support_group = Repo.get!(SupportGroup, id)
    render(conn, "show.json", sg: support_group)
  end

end
