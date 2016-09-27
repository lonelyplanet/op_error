defmodule BadRouteTest do
  use Test.ConnCase

  test "GET /bad-route" do
    conn = get build_conn, "/bad-route"
    %{"errors" => [error]} = json_response(conn, 404)

    assert error["title"] == "Resource Not Found"
    assert error["status"] == "404"
    assert error["detail"] == ""
  end
end
