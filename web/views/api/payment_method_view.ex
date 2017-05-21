defmodule Backend.Api.PaymentMethodView do
  use Backend.Web, :view

  def render("index.json", %{pms: pms}) do
    %{data: render_many(pms, Backend.Api.PaymentMethodView, "payment_method.json")}
  end

  def render("show.json", %{pm: pm}) do
    %{data: render_one(pm, Backend.Api.PaymentMethodView, "payment_method.json")}
  end

  def render("payment_method.json", %{payment_method: pm}) do
     %{name: pm.name, description: pm.description, id: pm.id}
  end

end
