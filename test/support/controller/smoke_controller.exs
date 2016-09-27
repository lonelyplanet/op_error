defmodule Test.SmokeController do
  use Test.Web, :controller

  def smoke(conn, _) do
    conn |> send_resp(200, "OK")
  end
end
