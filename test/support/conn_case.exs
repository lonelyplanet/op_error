defmodule Test.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Phoenix.ConnTest
      import Test.Router.Helpers
      @endpoint Test.Endpoint
    end
  end
end
