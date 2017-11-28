defmodule Paystack.Charge do

	@moduledoc """

	This module contains the public API functions for interfacing with the Paystack's charge endpoint.
	"""

	## body_params: A map with string keys
	## opts: Keyword list
	## reference: String

	
	@endpoint "charge/"

	## email, card, card.number, card.cvv, card.expiry_month, card.expiry_year
	## fields are required in the body_params
	def tokenize_payment_ingredient(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("tokenize"), body_params, opts)
	end

	## email, amount, card.number, card.cvv, card.expiry_month, card.expiry_year, 
	## bank.code, bank.account_number fields are required in the body_params are required while other fields are optional
	def charge(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint(), body_params, opts)
	end

	## pin and reference fields are required fields while others are optional
	## are required in the body_params
	def submit_pin(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("submit_pin"), body_params, opts)
	end

	## all fields are optional in the body_params
	def submit_otp(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("submit_otp"), body_params, opts)
	end

	## all fields are optional in the body_params
	def submit_phone(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("submit_phone"), body_params, opts)
	end	

	## all fields are optional in the body_params
	def submit_birthday(body_params, opts \\ []) do
		Paystack.request(:post, full_endpoint("submit_birthday"), body_params, opts)
	end

	def check_pending_charge(reference, opts \\ []) do
		Paystack.request(:get, full_endpoint(reference), "", opts)
	end

	defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end
end