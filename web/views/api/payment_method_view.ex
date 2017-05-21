defmodule Backend.Api.PaymentMethodView do
  use Backend.Web, :view

  def render("index.json", %{pms: pms}) do
    %{data: render_many(pms, Backend.Api.PaymentMethodView, "payment_method.json")}
  end

  def render("show.json", %{pm: pm}) do
    %{data: render_one(pm, Backend.Api.PaymentMethodView, "payment_method.json")}
  end

  def render("payment_method.json", %{pm: pm}) do
    pm
  end

end
