defmodule KVRegistry.Bucket do
  @moduledoc """
  A very basic implementation of a key value bucket that will be used
  as a building block to build our KV registry.
  """

  use Agent, restart: :temporary

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def get(bucket, key) do
    Agent.get(bucket, fn dict ->
      Map.get(dict, key)
    end)
  end

  def put(bucket, key, value) do
    Agent.update(bucket, fn dict ->
      Map.put(dict, key, value)
    end)
  end
end
