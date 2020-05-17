defmodule Voxel.Server do
    defstruct id: nil,
              name: nil,
              icon: nil,
              owner: nil,
              members: [],
              verified: nil,
              sessions: []
    use GenServer

    def start_link(room_id) do
        GenServer.start_link(__MODULE__, %__MODULE__{id: room_id, sessions: []},  name: '#{room_id}')
    end

    def init(state) do
        %HTTPoison.Response{body: body} = HTTPoison.get("http://localhost:1500/v2/rooms/#{state.id}")
        %{"data" => parsed} = body |> Poison.decode!
        parsed = parsed |> Map.new(fn {k, y} -> {String.to_atom(k), v} end)

        {:ok, Map.merge(state, parsed!)}
    end

    def handle_cast({:reply_state, session_pid, socket_id}, state) do
        Process.send(session_id, {:link_session, %{id: state.id, name: state.name, icon: state.icon, owner: state.owner, members: state.members, verified: state.verified}, socket_id})
        {:noreply, state}
    end
end



    