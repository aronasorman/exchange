defmodule Exchange.TodolistTest do
  use ExUnit.Case
  alias Exchange.Todolist

  setup do
    Todolist.reset
  end

  test "must be able to store todolists" do
    {:ok, _id} = Todolist.store("Eat cranberries later")
    :ok
  end

  test "must be able to retrieve a specific todo" do
    teststring = "Eat food later"
    {:ok, id} = Todolist.store(teststring)
    {:ok, str} = Todolist.retrieve(id)

    assert teststring == str
  end

  test "must return all todos" do
    todo1 = "1"
    todo2 = "2"

    Todolist.store(todo1)
    Todolist.store(todo2)

    assert Todolist.all == {:ok, [todo1, todo2]}
  end

  test "reset clears all todos" do
    Todolist.store("1")
    Todolist.store("1")
    Todolist.reset

    {:ok, todos} = Todolist.all
    assert todos == []
  end
end