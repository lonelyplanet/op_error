defmodule Test.Web do
  def controller do
    quote do
      use Phoenix.Controller, namespace: Test
      use OpError.Plug
    end
  end

  def controller_custom do
    quote do
      use Phoenix.Controller, namespace: Test
      use OpError.Plug, format: Test.CustomFormat
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
