defmodule Exchange.TodolistController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> render "index"
  end
end