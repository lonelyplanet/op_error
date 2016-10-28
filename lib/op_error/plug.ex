defmodule OpError.Plug do
  @moduledoc """
  Capture and Report Errors in JSON API Format

  This is meant to be `used` in either a Phoenix router or in your controller
  to capture errors and report on them in a format that is expected for the
  JSON-API spec
  """

  defmacro __using__(opts \\ []) do
    format = Keyword.get(opts, :format, OpError.Format)
    request_id = Keyword.get(opts, :request_id, "x-request-id")

    quote bind_quoted: [format: format, request_id: request_id] do
      @error_format format
      @request_id request_id

      def call(conn, opts) do
        import Plug.Conn
        import Phoenix.Controller
        import OpError.Plug

        try do
          super(conn, opts)
        rescue
          exception ->
            conn
            |> put_status(@error_format.error_code(exception))
            |> put_resp_content_type("application/json")
            |> assign_details(exception, @error_format)
            |> assign_id(exception, @request_id)
            |> put_view(OpError.View)
            |> render("error.json")
        end
      end
    end
  end

  @doc false
  def assign_details(conn, error, format) do
    import Plug.Conn

    conn
    |> assign(:status, format.error_code(error))
    |> assign(:title, format.error_title(error))
    |> assign(:detail, format.error_detail(error))
  end

  @doc false
  def assign_id(conn, _error, id_header) do
    import Plug.Conn

    error_id =
      case get_resp_header(conn, id_header) do
        [] -> :crypto.strong_rand_bytes(20) |> Base.hex_encode32(case: :lower)
        [id|_] -> id
      end

    conn |> assign(:error_id, error_id)
  end
end
