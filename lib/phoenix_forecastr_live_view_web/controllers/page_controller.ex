defmodule PhoenixForecastrLiveViewWeb.PageController do
  use PhoenixForecastrLiveViewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
