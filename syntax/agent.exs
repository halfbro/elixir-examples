{:ok, agent} = Agent.start_link fn -> [] end

Agent.update(agent, fn _list -> 123 end)
Agent.update(agent, fn content -> %{a: content} end)
Agent.update(agent, fn content -> [ 12 | [content]] end)
Agent.get(agent, fn content -> content end)
