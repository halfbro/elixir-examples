defmodule KVRegistry.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  @impl true
  def init(:ok) do
    children = [
      {KVRegistry.Registry, name: KVRegistry.Registry}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
