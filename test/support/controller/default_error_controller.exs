defmodule Test.DefaultErrorController do
  use Test.Web, :controller

  def four_oh_four(_conn, _params) do
    raise Ecto.NoResultsError, queryable: "nope"
  end

  def cast_error(_conn, _params) do
    raise Ecto.Query.CastError,
      message: "can't even cast it bro",
      type: "meh",
      value: "whatever"
  end

  def five_oh_oh(_conn, _params) do
    raise "Not What I Expected"
  end
end
