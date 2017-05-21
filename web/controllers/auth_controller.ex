defmodule Backend.AuthController do
  use Backend.Web, :controller

  def sign_in(conn, _params) do
    render conn, "login.html"
  end
end
