defmodule Paystack.Transaction do
	@moduledoc """

	This module contains the public APIs for interfacing with the Paystack's transaction endpoint.
	"""

	## body_params: json format
	## opts: Keyword list
	## reference: string
	## transaction_id: string
	## id: string

	
	@endpoint "transaction/"
	
	## amount and email fields are required in the body_params while others are optional
	def initialize_transaction(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("initialize"), body_params, opts)
	end

	def verify_transaction(reference, opts \\ []) do
		Paystack.request(:get, full_endpoint("verify/" <> reference), "", opts)
	end

	def list_transactions(opts \\ []) do
		Paystack.request(:get, full_endpoint(), "", opts)
	end

	def fetch_transaction(transaction_id, opts \\ []) do
		Paystack.request(:get, full_endpoint(transaction_id), "", opts)
	end

	## email, amount and authorization_code params are required in the body_params while others are optional
	def charge_authorization(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("charge_authorization"), body_params, opts)
	end

	def view_transaction_timeline(id, opts \\ []) do
		Paystack.request(:get, full_endpoint("timeline/" <> id), "", opts)
	end

	def transaction_totals(opts \\ []) do
		Paystack.request(:get, full_endpoint("totals"), "", opts)
	end

	def export_transactions(opts \\ []) do
		Paystack.request(:get, full_endpoint("export"), "", opts)
	end

	## email, amount and authorization_code params are required in the body_params while others are optional
	def request_reauthorization(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("request_reauthorization"), "", opts)
	end

	def check_authorization(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("check_authorization"), body_params, opts)
	end

	defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end

end