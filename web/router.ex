defmodule Exchange.Router do
  use Phoenix.Router

  pipeline :api do
    plug :json_api
  end

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Exchange.PageController, :index, as: :pages
  end

  scope "/api/v1" do
    pipe_through :api

    # todolist API
    resources "/todo", Exchange.TodolistController
  end

  # custom plugs
  def json_api(conn, _opts) do
    conn
    |> put_resp_content_type("application/json")
  end
end
