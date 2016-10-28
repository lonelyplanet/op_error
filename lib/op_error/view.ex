defmodule OpError.View do
  @moduledoc """
  Default Error View for JSON-API
  """

  use Phoenix.View, namespace: OpError, root: "web/templates"

  @doc false
  def render("error.json", error) do
    %{ errors: [ format(error) ] }
  end

  defp format(%{status: status, error_id: id}=error) do
    error
    |> Map.take([:status, :title, :detail])
    |> Map.put(:status, "#{status}")
    |> Map.put(:id, id)
  end
end
