defmodule KVRegistryTest do
  use ExUnit.Case
  doctest KVRegistry

  test "greets the world" do
    assert KVRegistry.hello() == :world
  end
end
