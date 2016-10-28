defmodule CustomErrorControllerTest do
  use Test.ConnCase

  test "GET /custom/nope" do
    conn = get build_conn, "/custom/nope"
    %{"errors" => [error]} = json_response(conn, 401)

    assert error["title"] == "Access Denied"
    assert error["status"] == "401"
    assert error["detail"] == "You do not have access to this!"
    assert error["id"] in Plug.Conn.get_resp_header(conn, "some-special-id")
  end

  test "GET /custom/boom" do
    conn = get build_conn, "/custom/boom"
    %{"errors" => [error]} = json_response(conn, 500)

    assert error["title"] == "Internal Error"
    assert error["status"] == "500"
    assert error["detail"] == ""
    assert error["id"] in Plug.Conn.get_resp_header(conn, "some-special-id")
  end
end
