defmodule KVRegistry.Registry do
  @moduledoc """
  A registry where we can interface with lots of buckets
  """
  # TODO: Fix bug where crashing a bucket causes the registry to hold
  #       a reference to a dead process

  use GenServer

  ## Client API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def lookup(registry, name) do
    GenServer.call(registry, {:lookup, name})
  end

  def create(registry, name) do
    GenServer.cast(registry, {:create, name})
  end

  ## Defining GenServer Callbacks

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:lookup, name}, _from, names) do
    {:reply, Map.fetch(names, name), names}
  end

  @impl true
  def handle_cast({:create, name}, names) do
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = KVRegistry.Bucket.new_bucket([])
      {:noreply, Map.put(names, name, bucket)}
    end
  end
end
