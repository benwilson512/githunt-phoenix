defmodule GitHunt.Web.UserSocket do
  use Phoenix.Socket
  channel "__absinthe__:*", Absinthe.Phoenix.Channel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    opts = [
      context: %{pubsub: GitHunt.Web.Endpoint},
      jump_phases: false,
    ]

    socket =
      socket
      |> assign(:absinthe, %{
        schema_mod: GitHunt.Web.Schema,
        opts: opts,
      })

    {:ok, socket}
  end

  def id(_socket), do: nil
end
