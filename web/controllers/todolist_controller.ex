defmodule Exchange.TodolistController do
  use Phoenix.Controller
  alias Exchange.Todolist

  plug :action

  def index(conn, _params) do
    todos = Todolist.all
    conn
    |> render("index.json", %{todos: todos})
  end
end