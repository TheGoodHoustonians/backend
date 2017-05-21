defmodule Backend.AuthController do
  use Backend.Web, :controller
  alias Backend.Actions.SigninUser

  def sign_in(conn, _params) do
    render conn, "login.html"
  end

  def create(conn, %{ "signin" => %{ "email" => email, "password" => password } }) do
    case SigninUser.execute(email, password) do
      {:error, message} ->
        conn
        |> put_flash(:error, message)
        |> render("login.html")
      {:ok, user} ->
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:success, "Signed in")
        |> redirect(to: "/")
    end
  end
  def create(conn, _params) do
    conn
    |> put_flash(:error, "Email and Password are required")
    |> render("login.html")
  end

  def sign_out(conn, _params) do
    conn
    |> put_session(:current_user, nil)
    |> put_flash(:success, "Signed out")
    |> redirect(to: "/")
  end
end
