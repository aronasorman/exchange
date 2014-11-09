defmodule Exchange.Todolist do
  use GenServer

  defmodule State do
    defstruct todos: %{}
  end
  #
  # Todolist Genserver API
  #

  def start_link do
    Agent.start_link(fn -> %State{} end, name: __MODULE__)
  end

  def store(task) do
    newlength = Agent.get_and_update(__MODULE__,
                                     fn state ->
                                          ref = make_ref
                                          newstate = %{state | todos: Dict.put(state.todos, ref, task)}

                                          {ref, newstate}
                                     end)
    {:ok, newlength}
  end

  def retrieve(id) do
    Agent.get(__MODULE__,
              fn state ->
                   result = Dict.get(state.todos, id)
                   {:ok, result}
              end)
  end

  def reset do
    Agent.update(__MODULE__, fn _state -> %State{} end)
  end

  def all do
    todos = Agent.get(__MODULE__, fn state -> Dict.values(state.todos) end)
    {:ok, todos}
  end
end