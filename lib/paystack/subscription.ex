defmodule Paystack.Subscription do
	@moduledoc """

	This module contains the public API functions for interfacing with the Paystack's subscription endpoint.
	"""

	## body_params: a map with string keys
	## opts: Keyword list
	## sub_id_or_code: string

  @endpoint "subscription/"

	## customer and plan fields are required in the body_params while others are optional
  def create_subscription(body_params, opts \\ []) do
    Paystack.request(:post, full_endpoint(), body_params, opts)
  end

	def list_subscriptions(opts \\ []) do
		Paystack.request(:get, full_endpoint(), "", opts)
	end

	## code and token fields are required in the body_params 
	def disable_subscription(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("disable"), body_params, opts)
	end
	
	## code and token fields are required in the body_params
	def enable_subscription(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("enable"), body_params, opts)
	end

	def fetch_subscription(sub_id_or_code, opts \\ []) do
		Paystack.request(:post, full_endpoint("enable"), "", opts)
	end

  defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end
end