defmodule FiberexCatanWeb.PageController do
  use FiberexCatanWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
