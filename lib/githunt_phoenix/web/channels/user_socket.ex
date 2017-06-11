defmodule GitHunt.Web.UserSocket do
  use Phoenix.Socket
  channel "__absinthe__:*", Absinthe.Phoenix.Channel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
