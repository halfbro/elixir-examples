defmodule Example do
  use GenServer

  # 'Client' API definition/implementation

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, [])
  end

  def get(server, key) do
    GenServer.call(server, {:lookup, key})
  end

  def set(server, key, value) do
    GenServer.cast(server, {:insert, key, value})
  end

  # 'Server' definition/implementation

  @impl true
  def init(:ok) do
    {:ok, %{a: 3}}
  end

  @impl true
  def handle_call({:lookup, key}, _from, map) do
    {:reply, Map.fetch(map, key), map}
  end

  @impl true
  def handle_cast({:insert, key, value}, map) do
    {:noreply, Map.put(map, key, value)}
  end
end

{:ok, m} = Example.start_link()
Example.get(m, :a)
Example.set(m, :a, 1)
Example.set(m, :b, 2)
Example.get(m, :a)
Example.get(m, :b)
