defmodule PhoenixForecastrLiveViewWeb.Forecastr do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <form phx-submit="set-location">
    <input name="location" placeholder="Location" value="<%= @location %>"/>
    <%= @weather %>
    </form>
    </div>
    """
  end

  def mount(_session, socket) do
    send(self(), {:put, "Caorle"})
    {:ok, assign(socket, location: nil, weather: "...")}
  end

  def handle_event("set-location", %{"location" => location}, socket) do
    {:noreply, put_location(socket, location)}
  end

  def handle_info({:put, location}, socket) do
    {:noreply, put_location(socket, location)}
  end

  defp put_location(socket, location) do
    assign(socket, location: location, weather: weather(location))
  end

  defp weather(local) do
    {:ok, ascii_weather} =
      Forecastr.forecast(
        :today,
        local,
        %{units: :metric},
        Forecastr.Renderer.ASCII
      )

    ascii_weather
  end
end
