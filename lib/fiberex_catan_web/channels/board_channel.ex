defmodule FiberexCatanWeb.BoardChannel do
  use FiberexCatanWeb, :channel

  @impl true
  def join("board:lobby", payload, socket) do
    if authorized?(payload) do
      send(self, {:after_join, payload})
      {:ok, assign(socket, "server thing", "only the server sees this")}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, Map.put(payload, "key", "supah-secret message")}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (board:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  def handle_info({:after_join, _message}, socket) do
    board = %{
      edges: %{
        %Location{d: :s, q: -1, r: 2} => %{harbor_resource: :any},
        %Location{d: :s, q: 0, r: -3} => %{harbor_resource: :any},
        %Location{d: :s, q: 1, r: 1} => %{harbor_resource: :grain},
        %Location{d: :se, q: -3, r: 1} => %{harbor_resource: :brick},
        %Location{d: :se, q: -2, r: -1} => %{harbor_resource: :lumber},
        %Location{d: :se, q: 2, r: 0} => %{harbor_resource: :any, player: :red},
        %Location{d: :sw, q: -2, r: 2} => %{harbor_resource: :any},
        %Location{d: :sw, q: 2, r: -3} => %{harbor_resource: :wool},
        %Location{d: :sw, q: 3, r: -2} => %{harbor_resource: :ore}
      },
      tiles: %{
        %Location{d: nil, q: -1, r: 0} => %{
          chit: 8,
          resource: :wool,
          robber: false,
          terrain: :pasture,
          name: nil
        },
        %Location{d: nil, q: -1, r: 3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 1, r: 0} => %{
          chit: 2,
          resource: :ore,
          robber: false,
          terrain: :mountains,
          name: nil
        },
        %Location{d: nil, q: 2, r: 0} => %{
          chit: 12,
          resource: :brick,
          robber: false,
          terrain: :hills,
          name: nil
        },
        %Location{d: nil, q: 2, r: -4} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: 0, r: -3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: -3, r: -1} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: 1, r: 2} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 0, r: 0} => %{
          chit: 6,
          resource: :brick,
          robber: false,
          terrain: :hills,
          name: nil
        },
        %Location{d: nil, q: -3, r: 3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: -3, r: 0} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 1, r: -1} => %{
          chit: nil,
          resource: nil,
          robber: true,
          terrain: :desert,
          name: nil
        },
        %Location{d: nil, q: 2, r: -1} => %{
          chit: 10,
          resource: :wool,
          robber: false,
          terrain: :pasture,
          name: nil
        },
        %Location{d: nil, q: 1, r: -3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 3, r: -3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 3, r: -4} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: 0, r: 3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 0, r: -2} => %{
          chit: 8,
          resource: :lumber,
          robber: false,
          terrain: :forest,
          name: nil
        },
        %Location{d: nil, q: -1, r: 1} => %{
          chit: 12,
          resource: :grain,
          robber: false,
          terrain: :fields,
          name: nil
        },
        %Location{d: nil, q: -2, r: 4} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: -2, r: 0} => %{
          chit: 3,
          resource: :grain,
          robber: false,
          terrain: :fields,
          name: nil
        },
        %Location{d: nil, q: 3, r: -1} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 0, r: 1} => %{
          chit: 4,
          resource: :wool,
          robber: false,
          terrain: :pasture,
          name: nil
        },
        %Location{d: nil, q: -2, r: 3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: -1, r: -1} => %{
          chit: 11,
          resource: :brick,
          robber: false,
          terrain: :hills,
          name: nil
        },
        %Location{d: nil, q: 0, r: 2} => %{
          chit: 5,
          resource: :wool,
          robber: false,
          terrain: :pasture,
          name: nil
        },
        %Location{d: nil, q: -2, r: 1} => %{
          chit: 10,
          resource: :lumber,
          robber: false,
          terrain: :forest,
          name: nil
        },
        %Location{d: nil, q: -3, r: 1} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: -3, r: 4} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: -1, r: -2} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: -3, r: 2} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 2, r: 2} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: 3, r: 0} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 3, r: 1} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: -2, r: -2} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: nil,
          name: nil
        },
        %Location{d: nil, q: 3, r: -2} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 2, r: -3} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 1, r: -2} => %{
          chit: 4,
          resource: :brick,
          robber: false,
          terrain: :hills,
          name: nil
        },
        %Location{d: nil, q: 2, r: -2} => %{
          chit: 9,
          resource: :ore,
          robber: false,
          terrain: :mountains,
          name: nil
        },
        %Location{d: nil, q: -1, r: 2} => %{
          chit: 11,
          resource: :lumber,
          robber: false,
          terrain: :forest,
          name: nil
        },
        %Location{d: nil, q: -2, r: -1} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 2, r: 1} => %{
          chit: nil,
          resource: nil,
          robber: false,
          terrain: :water,
          name: nil
        },
        %Location{d: nil, q: 0, r: -1} => %{
          chit: 9,
          resource: :lumber,
          robber: false,
          terrain: :forest,
          name: nil
        },
        %Location{d: nil, q: 1, r: 1} => %{
          chit: 5,
          resource: :grain,
          robber: false,
          terrain: :fields,
          name: nil
        },
        %Location{d: nil, q: -2, r: 2} => %{
          chit: 6,
          resource: :grain,
          robber: false,
          terrain: :fields,
          name: nil
        }
      },
      vertices: %{
        %Location{d: :left, q: -1, r: 1} => %{player: :red, type: :settlement},
        %Location{d: :right, q: 0, r: 1} => %{player: :white, type: :city}
      }
    }

    push socket, "board_state_updated", %{board_state: FiberexCatan.BoardTransformer.transform(board)}
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
