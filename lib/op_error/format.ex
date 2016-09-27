defmodule OpError.Format do
  @moduledoc """
  Default Error Format Module

  This is the format module that is used to format errors by
  default when none is specified.
  """

  @default_404_errors [
    Ecto.CastError,
    Ecto.NoResultsError,
    Phoenix.Router.NoRouteError
  ]

  @doc false
  def error_code(%{__struct__: e}) when e in @default_404_errors, do: 404
  def error_code(_), do: 500

  @doc false
  def error_title(%{__struct__: e}) when e in @default_404_errors, do: "Resource Not Found"
  def error_title(%{message: msg}) when is_binary(msg), do: msg
  def error_title(_), do: "Internal Error"

  @doc false
  def error_detail(_), do: ""
end
