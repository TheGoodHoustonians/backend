defmodule Backend.Api.OutreachProgramView do
  use Backend.Web, :view

  def render("index.json", %{ops: ops}) do
    %{data: render_many(ops, Backend.Api.OutreachProgramView, "outreach_program.json")}
  end

  def render("show.json", %{op: op}) do
    %{data: render_one(op, Backend.Api.OutreachProgramView, "outreach_program.json")}
  end

  def render("outreach_program.json", %{op: op}) do
    op
  end
end