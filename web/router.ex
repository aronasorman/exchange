defmodule Exchange.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Exchange.PageController, :index, as: :pages

    # todolist API
    resources "/todo", Exchange.TodolistController
  end
end
