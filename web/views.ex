defmodule Exchange.Views do

  defmacro __using__(_options) do
    quote do
      use Phoenix.View
      import unquote(__MODULE__)

      # This block is expanded within all views for aliases, imports, etc
      import Exchange.I18n
      import Exchange.Router.Helpers
      alias Phoenix.Controller.Flash
      alias Poison, as: JSON
    end
  end
end
