defmodule Paystack.Customer do
	@endpoint "customer/"

	def create_customer(body_params, opts \\ []) do		
		Paystack.request(:post, full_endpoint(), body_params, opts)
	end

	def list_customers(opts \\ []) do
		Paystack.request(:get, full_endpoint(), opts)
	end

	def fetch_customer(customer_id, opts \\ []) do
		Paystack.request(:get, full_endpoint(customer_id), "", opts)
	end

	def update_customer(customer_code_or_id, body_params, opts \\ []) do
		Paystack.request(:put, full_endpoint(customer_code_or_id), body_params, opts)
	end

	def blacklist_customer(customer_id_email_or_code, risk_action \\ "allow", opts \\ []) do
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
