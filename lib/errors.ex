defmodule Backend.Errors do

  @moduledoc """
  Errors module provides functions to help handle errors
  """

  def get_error_messages(changeset) do
    IO.puts "#{inspect changeset}"
    for {field_name, message} <- changeset.errors do
      field = field_name
        |> to_string
        |> String.replace("_", " ")
        |> String.capitalize
      "#{field} #{message}"
    end
  end

end