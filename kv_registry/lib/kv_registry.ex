defmodule KVRegistry do
  use Application

  @impl true
  def start(_type, _args) do
    KVRegistry.Supervisor.start_link(name: KVRegistry.Supervisor)
  end
end
