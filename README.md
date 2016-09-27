# OpError

A simple error formatter for the JSON API spec that puts the control of
formatting in your hand without needing to do the dirty work.

## Usage

Place in your router or Phoenix web as a using statement:

  * In your router

    ``` elixir
    defmodule App.Router do
      use Phoenix.Router
      use OpError.Plug
      # ....
    end
    ```

  * In the `web.ex`

    ``` elixir
    defmodule App.Web do
      # ....
      def controller do
        quote do
          use Phoenix.Controller, namespace: App
          use OpError.Plug
        end
      end
      # ....
    end
    ```

## Customize Errors

You can override the data sent as errors to the end user by specifying your own
format module.  The format module is expected to implement the following
functions and are passed the exception being reported on:

  * `error_code/1`
  * `error_title/1`
  * `error_detail/1`

  ``` elixir
  defmodule CustomErrorFormat do
    def error_code(%{__struct__: CrazyError}), do: 504
    def error_code(_error), do: 500

    def error_title(%{__struct__: CrazyError}), do: "Noooo!!"
    def error_title(_error), do: "Internal Error"

    def error_detail(%{__struct__: CrazyError, message: msg}),
      do: "It's happend again, this time it's #{msg}"
    def error_detail(_error), do: ""
  end
  ```

  ``` elixir
  use OpError.Plug, format: CustomErrorFormat
  ```

## Installation


Add `op_error` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:op_error, github: "lonelyplanet/op_error"}]
end
```
