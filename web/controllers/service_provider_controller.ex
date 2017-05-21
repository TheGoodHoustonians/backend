defmodule Backend.ServiceProviderController do
  use Backend.Web, :controller

  alias Backend.ServiceProvider

  def index(conn, _params) do
    service_providers = Repo.all(ServiceProvider)
    render(conn, "index.html", service_providers: service_providers)
  end

  def new(conn, _params) do
    changeset = ServiceProvider.changeset(%ServiceProvider{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"service_provider" => service_provider_params}) do

    IO.puts "FASCINASTING #{inspect service_provider_params}"
    changeset = ServiceProvider.changeset(%ServiceProvider{}, service_provider_params)

    case Repo.insert(changeset) do
      {:ok, _service_provider} ->
        conn
        |> put_flash(:info, "Service provider created successfully.")
        |> redirect(to: service_provider_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    service_provider = Repo.get!(ServiceProvider, id)
    render(conn, "show.html", service_provider: service_provider)
  end

  def edit(conn, %{"id" => id}) do
    service_provider = Repo.get!(ServiceProvider, id)
    changeset = ServiceProvider.changeset(service_provider)
    render(conn, "edit.html", service_provider: service_provider, changeset: changeset)
  end

  def update(conn, %{"id" => id, "service_provider" => service_provider_params}) do
    service_provider = Repo.get!(ServiceProvider, id)
    changeset = ServiceProvider.changeset(service_provider, service_provider_params)

    case Repo.update(changeset) do
      {:ok, service_provider} ->
        conn
        |> put_flash(:info, "Service provider updated successfully.")
        |> redirect(to: service_provider_path(conn, :show, service_provider))
      {:error, changeset} ->
        render(conn, "edit.html", service_provider: service_provider, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    service_provider = Repo.get!(ServiceProvider, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(service_provider)

    conn
    |> put_flash(:info, "Service provider deleted successfully.")
    |> redirect(to: service_provider_path(conn, :index))
  end
end
