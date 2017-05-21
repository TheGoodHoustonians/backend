defmodule Backend.Router do
  use Backend.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Backend.Plugs.AuthenticateUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Backend do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController

    get "/", PageController, :index

    get "/login", AuthController, :sign_in
    post "/login", AuthController, :create
    get "/logout", AuthController, :sign_out

    get "/registration/new", UserController, :new
    post "/registration", UserController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Backend do
  #   pipe_through :api
  # end
end
