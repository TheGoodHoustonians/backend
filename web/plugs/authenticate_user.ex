defmodule Backend.Plugs.AuthenticateUser do
  import Plug.Conn
  alias Backend.User
  alias Backend.Repo

  @moduledoc """
  This plug handles authentication.
  """

  def init(options) do
    options
  end

  def call(conn, _) do
    user_id = conn |> get_session(:current_user)
    case _get_user(user_id) do
      user -> conn |> assign(:current_user, user)
      _ -> conn
    end
  end

  defp _get_user(id) when is_integer(id), do: User |> Repo.get(id)
  defp _get_user(_), do: nil

end