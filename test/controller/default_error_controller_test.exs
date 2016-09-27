defmodule DefaultErrorControllerTest do
  use Test.ConnCase

  test "GET /default/404" do
    conn = get build_conn, "/default/404"
    %{"errors" => [error]} = json_response(conn, 404)

    assert error["title"] == "Resource Not Found"
    assert error["status"] == "404"
    assert error["detail"] == ""
  end

  test "get /default/500" do
    conn = get build_conn, "/default/500"
    %{"errors" => [error]} = json_response(conn, 500)

    assert error["title"] == "Not What I Expected"
    assert error["status"] == "500"
    assert error["detail"] == ""
  end
end
