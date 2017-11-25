defmodule Paystack.Customer do

	@moduledoc """

	This module contains the public APIs for interfacing with the Paystack's customer endpoint.
	"""

	## body_params: json format
	## opts: Keyword list
	## customer_id: string
	## customer_code_or_id: string
	## customer_id_email_or_code: string
	## risk_action: string

	@endpoint "customer/"

	## Email field is required in the body_params while others are optional
	def create_customer(body_params, opts \\ []) do		
		Paystack.request(:post, full_endpoint(), body_params, opts)
	end

	def list_customers(opts \\ []) do
		Paystack.request(:get, full_endpoint(), opts)
	end

	def fetch_customer(customer_id, opts \\ []) do
		Paystack.request(:get, full_endpoint(customer_id), "", opts)
	end

	## All fields are optional. Only insert the fields you want to update.
	def update_customer(customer_code_or_id, body_params, opts \\ []) do
		Paystack.request(:put, full_endpoint(customer_code_or_id), body_params, opts)
	end

	## The default value of risk_action is "deny" which will blacklist a customer; "allow" will whitelist the customer 
	def blacklist_customer(customer_id_email_or_code, risk_action \\ "deny", opts \\ []) do
		body_params = '{"customer": "#{customer_id_email_or_code}", "risk_action": "#{risk_action}"}'
		Paystack.request(:post, full_endpoint("set_risk_action"), body_params, opts)
	end

	def deactivate_authorization(opts \\ []) do
		body_params = '{"authorization_code": "AUTH_au6hc0de"}'
		Paystack.request(:post, full_endpoint("deactivate_authorization"), body_params, opts)
	end

	defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end

end
