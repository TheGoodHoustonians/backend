defmodule Backend.Api.EducationSupportController do
  use Backend.Web, :controller

  alias Backend.EducationSupport

  def index(conn, _params) do
    education_supports = Repo.all(EducationSupport)
    render(conn, "index.json", esus: education_supports)
  end

  def show(conn, %{"id" => id}) do
    education_support = Repo.get!(EducationSupport, id)
    render(conn, "show.json", esu: education_support)
  end

end
