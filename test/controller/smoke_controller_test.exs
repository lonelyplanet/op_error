defmodule SmokeControllerTest do
  use Test.ConnCase

  test "GET /smoke" do
    conn = get build_conn(), "/smoke"
    assert conn.status == 200
    assert conn.resp_body == "OK"
  end
end
