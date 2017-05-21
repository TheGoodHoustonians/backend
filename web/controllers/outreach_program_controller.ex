defmodule Backend.OutreachProgramController do
  use Backend.Web, :controller

  alias Backend.OutreachProgram

  def index(conn, _params) do
    outreach_programs = Repo.all(OutreachProgram)
    render(conn, "index.html", outreach_programs: outreach_programs)
  end

  def new(conn, _params) do
    changeset = OutreachProgram.changeset(%OutreachProgram{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"outreach_program" => outreach_program_params}) do
    changeset = OutreachProgram.changeset(%OutreachProgram{}, outreach_program_params)

    case Repo.insert(changeset) do
      {:ok, _outreach_program} ->
        conn
        |> put_flash(:info, "Outreach program created successfully.")
        |> redirect(to: outreach_program_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    outreach_program = Repo.get!(OutreachProgram, id)
    render(conn, "show.html", outreach_program: outreach_program)
  end

  def edit(conn, %{"id" => id}) do
    outreach_program = Repo.get!(OutreachProgram, id)
    changeset = OutreachProgram.changeset(outreach_program)
    render(conn, "edit.html", outreach_program: outreach_program, changeset: changeset)
  end

  def update(conn, %{"id" => id, "outreach_program" => outreach_program_params}) do
    outreach_program = Repo.get!(OutreachProgram, id)
    changeset = OutreachProgram.changeset(outreach_program, outreach_program_params)

    case Repo.update(changeset) do
      {:ok, outreach_program} ->
        conn
        |> put_flash(:info, "Outreach program updated successfully.")
        |> redirect(to: outreach_program_path(conn, :show, outreach_program))
      {:error, changeset} ->
        render(conn, "edit.html", outreach_program: outreach_program, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    outreach_program = Repo.get!(OutreachProgram, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(outreach_program)

    conn
    |> put_flash(:info, "Outreach program deleted successfully.")
    |> redirect(to: outreach_program_path(conn, :index))
  end
end
