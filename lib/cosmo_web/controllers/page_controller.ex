defmodule CosmoWeb.PageController do
  use CosmoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
