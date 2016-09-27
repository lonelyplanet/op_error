defmodule Test.CustomErrorController do
  use Test.Web, :controller_custom

  def private_access(_conn, _params) do
    raise "not permitted"
  end

  def problematic_call(_conn, _params) do
    raise "it blew up again!"
  end
end
