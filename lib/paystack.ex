defmodule Paystack do
  @moduledoc """
  Documentation for Paystack.
  """
  alias Paystack.Error.StatusCodeError
  alias Paystack.Error.ConnectionError

  @api_url "https://api.paystack.co/"
	@header [{"Content-Type", "application/json"}, 
					{"Authorization", "Bearer sk_test_9e0117e99805ee86c7507c5f6ae8ae41449e5312"}]
 
  def request(action, endpoint, body \\ "", opts \\ []) do
    HTTPoison.request(action, full_url(endpoint), encode_body(body), @header, opts)
    |> handle_response
  end

  def full_url(endpoint) do
    @api_url <> endpoint 
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    {:ok, process_response_body(body)}
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: 201}}) do
    {:ok, process_response_body(body)}
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body, status_code: code}}) do
    message_error = process_response_body(body) 

    error_tuple = 
    case code do
      _ -> {:error, %StatusCodeError{status_code: code, message: message_error}}
    end

    error_tuple
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, %ConnectionError{message: reason}}
  end

  defp process_response_body(body) do
    Poison.decode!(body)
  end

  defp encode_body(body) do
    Poison.encode!(body)
  end
end
