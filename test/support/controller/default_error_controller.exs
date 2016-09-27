defmodule Test.DefaultErrorController do
  use Test.Web, :controller

  def four_oh_four(_conn, _params) do
    raise Ecto.NoResultsError, queryable: "nope"
  end

  def five_oh_oh(_conn, _params) do
    raise "Not What I Expected"
  end
end
