defmodule Exchange.TodolistController do
  use Phoenix.Controller
  alias Exchange.Todolist

  plug :action

  def index(conn, _params) do
    todos = Todolist.all
    conn
    |> render("index", %{todos: todos})
  end
end