defmodule Test.CustomFormat do
  def error_code(%{message: "not permitted"}), do: 401
  def error_code(_), do: 500

  def error_title(%{message: "not permitted"}), do: "Access Denied"
  def error_title(_), do: "Internal Error"

  def error_detail(%{message: "not permitted"}),
    do: "You do not have access to this!"
  def error_detail(_), do: ""
end
