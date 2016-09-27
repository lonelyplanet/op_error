defmodule Test.Router do
  use Phoenix.Router
  use OpError.Plug

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/" do
    pipe_through :api

    get "/smoke", Test.SmokeController, :smoke

    get "/default/404", Test.DefaultErrorController, :four_oh_four
    get "/default/500", Test.DefaultErrorController, :five_oh_oh

    get "/custom/nope", Test.CustomErrorController, :private_access
    get "/custom/boom", Test.CustomErrorController, :problematic_call
  end
end
