defmodule CosmoWeb.Router do
  use CosmoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CosmoWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", CosmoWeb do
    pipe_through :api
    resources "/crowd_stats", CrowdStatController, except: [:new, :edit]
  end
end
