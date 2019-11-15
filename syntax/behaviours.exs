defmodule Parser do
  @callback parse(String.t) :: {:ok, term} | {:error, String.t}
  @callback extensions() :: [String.t]
end

defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  def parse(str) do
    {:ok, "definitely parsing here"}
  end

  @impl Parser
  def extensions() do
    ["json"]
  end
end
