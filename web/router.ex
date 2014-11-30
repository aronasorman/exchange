defmodule Exchange.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
  end

  pipeline :api do
    plug :accepts, ~w(json)
    plug :fetch_session
  end

  scope "/", Exchange do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api/v1", Exchange do
    pipe_through :api

    get "/todos", TodolistController, :index
  end
end
