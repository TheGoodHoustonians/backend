defmodule Backend.SupportGroupController do
  use Backend.Web, :controller

  alias Backend.SupportGroup

  def index(conn, _params) do
    support_groups = Repo.all(SupportGroup)
    render(conn, "index.html", support_groups: support_groups)
  end

  def new(conn, _params) do
    changeset = SupportGroup.changeset(%SupportGroup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"support_group" => support_group_params}) do
    changeset = SupportGroup.changeset(%SupportGroup{}, support_group_params)

    case Repo.insert(changeset) do
      {:ok, _support_group} ->
        conn
        |> put_flash(:info, "Support group created successfully.")
        |> redirect(to: support_group_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    support_group = Repo.get!(SupportGroup, id)
    render(conn, "show.html", support_group: support_group)
  end

  def edit(conn, %{"id" => id}) do
    support_group = Repo.get!(SupportGroup, id)
    changeset = SupportGroup.changeset(support_group)
    render(conn, "edit.html", support_group: support_group, changeset: changeset)
  end

  def update(conn, %{"id" => id, "support_group" => support_group_params}) do
    support_group = Repo.get!(SupportGroup, id)
    changeset = SupportGroup.changeset(support_group, support_group_params)

    case Repo.update(changeset) do
      {:ok, support_group} ->
        conn
        |> put_flash(:info, "Support group updated successfully.")
        |> redirect(to: support_group_path(conn, :show, support_group))
      {:error, changeset} ->
        render(conn, "edit.html", support_group: support_group, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    support_group = Repo.get!(SupportGroup, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(support_group)

    conn
    |> put_flash(:info, "Support group deleted successfully.")
    |> redirect(to: support_group_path(conn, :index))
  end
end
