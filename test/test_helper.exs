ExUnit.start()

Code.require_file "./support/router.exs", __DIR__
Code.require_file "./support/endpoint.exs", __DIR__
Code.require_file "./support/web.exs", __DIR__
Code.require_file "./support/conn_case.exs", __DIR__
Code.require_file "./support/custom_format.exs", __DIR__

Code.require_file "./support/controller/smoke_controller.exs", __DIR__
Code.require_file "./support/controller/default_error_controller.exs", __DIR__
Code.require_file "./support/controller/custom_error_controller.exs", __DIR__


Logger.configure(level: :error)
{:ok, _pid} = Test.Endpoint.start_link
