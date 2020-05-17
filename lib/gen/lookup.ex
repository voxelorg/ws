defmodule Voxel.Lookup do
    def link_room_session(room_id, session) do
        {:ok, room} = GenRegistry.lookup_or_start(Voxel.Server, room_id, [room_id])

        IO.inspect room
        GenServer.case(room, {:link_session, session})
    end
end