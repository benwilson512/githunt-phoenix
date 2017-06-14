defmodule GitHunt.Web.UserSocket do
  use Phoenix.Socket

  use Absinthe.Phoenix.Channel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    socket = socket |> assign(:absinthe, %{
      schema: GitHunt.Web.Schema,
    })

    {:ok, socket}
  end

  def id(_socket), do: nil
end
