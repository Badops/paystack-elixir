defmodule Paystack.Error.StatusCodeError do
  defexception status_code: nil, message: nil
end