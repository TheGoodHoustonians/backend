defmodule Backend.SubstanceAbuseTreatmentController do
  use Backend.Web, :controller

  alias Backend.SubstanceAbuseTreatment

  def index(conn, _params) do
    substance_abuse_treatments = Repo.all(SubstanceAbuseTreatment)
    render(conn, "index.html", substance_abuse_treatments: substance_abuse_treatments)
  end

  def new(conn, _params) do
    changeset = SubstanceAbuseTreatment.changeset(%SubstanceAbuseTreatment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"substance_abuse_treatment" => substance_abuse_treatment_params}) do
    changeset = SubstanceAbuseTreatment.changeset(%SubstanceAbuseTreatment{}, substance_abuse_treatment_params)

    case Repo.insert(changeset) do
      {:ok, _substance_abuse_treatment} ->
        conn
        |> put_flash(:info, "Substance abuse treatment created successfully.")
        |> redirect(to: substance_abuse_treatment_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    substance_abuse_treatment = Repo.get!(SubstanceAbuseTreatment, id)
    render(conn, "show.html", substance_abuse_treatment: substance_abuse_treatment)
  end

  def edit(conn, %{"id" => id}) do
    substance_abuse_treatment = Repo.get!(SubstanceAbuseTreatment, id)
    changeset = SubstanceAbuseTreatment.changeset(substance_abuse_treatment)
    render(conn, "edit.html", substance_abuse_treatment: substance_abuse_treatment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "substance_abuse_treatment" => substance_abuse_treatment_params}) do
    substance_abuse_treatment = Repo.get!(SubstanceAbuseTreatment, id)
    changeset = SubstanceAbuseTreatment.changeset(substance_abuse_treatment, substance_abuse_treatment_params)

    case Repo.update(changeset) do
      {:ok, substance_abuse_treatment} ->
        conn
        |> put_flash(:info, "Substance abuse treatment updated successfully.")
        |> redirect(to: substance_abuse_treatment_path(conn, :show, substance_abuse_treatment))
      {:error, changeset} ->
        render(conn, "edit.html", substance_abuse_treatment: substance_abuse_treatment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    substance_abuse_treatment = Repo.get!(SubstanceAbuseTreatment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(substance_abuse_treatment)

    conn
    |> put_flash(:info, "Substance abuse treatment deleted successfully.")
    |> redirect(to: substance_abuse_treatment_path(conn, :index))
  end
end
