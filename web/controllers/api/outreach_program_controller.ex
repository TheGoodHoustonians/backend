defmodule Backend.Api.OutreachProgramController do
  use Backend.Web, :controller

  alias Backend.OutreachProgram

  def index(conn, _params) do
    outreach_programs = Repo.all(OutreachProgram)
    render(conn, "index.json", ops: outreach_programs)
  end

  def show(conn, %{"id" => id}) do
    outreach_program = Repo.get!(OutreachProgram, id)
    render(conn, "show.json", op: outreach_program)
  end

end
