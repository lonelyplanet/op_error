defmodule Test.Router do
  use Phoenix.Router
  use OpError.Plug

  pipeline :api do
    plug :accepts, ~w(json)
  end

  pipeline :custom do
    plug :accepts, ~w(json)
    plug Plug.RequestId, http_header: "some-special-id"
  end

  scope "/default" do
    pipe_through :api

    get "/404", Test.DefaultErrorController, :four_oh_four
    get "/500", Test.DefaultErrorController, :five_oh_oh
    get "/cast_error", Test.DefaultErrorController, :cast_error
  end

  scope "/custom" do
    pipe_through :custom

    get "/nope", Test.CustomErrorController, :private_access
    get "/boom", Test.CustomErrorController, :problematic_call
  end

  scope "/" do
    pipe_through :api

    get "/smoke", Test.SmokeController, :smoke
  end
end
