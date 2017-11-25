defmodule Paystack.Plan do

	@moduledoc """

	This module contains the public APIs for interfacing with the Paystack's plan endpoint.
	"""

	## body_params: a map with string keys
	## opts: Keyword list
	## plan_id_or_code: string


	@endpoint "plan/"

	## name and amount field is required
 	def create_plan(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint(), body_params, opts)
	end

	def list_plan(opts \\ []) do
		Paystack.request(:get, full_endpoint(), "", opts)
	end

	def fetch_plan(plan_id_or_code, opts \\ []) do
		Paystack.request(:get, full_endpoint(plan_id_or_code), "", opts)
	end

	## All fields are optional. Only insert the fields you want to update.
	def update_plan(plan_id_or_code, body_params, opts \\ []) do
		Paystack.request(:put, full_endpoint(plan_id_or_code), body_params, opts)
	end
	
	defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end
end