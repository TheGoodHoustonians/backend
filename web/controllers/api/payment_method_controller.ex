defmodule Backend.Api.PaymentMethodController do
  use Backend.Web, :controller

  alias Backend.PaymentMethod

  def index(conn, _params) do
    payment_methods = Repo.all(PaymentMethod)
    render(conn, "index.json", pms: payment_methods)
  end

  def show(conn, %{"id" => id}) do
    payment_method = Repo.get!(PaymentMethod, id)
    render(conn, "show.json", pm: payment_method)
  end

end
