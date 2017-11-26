defmodule Paystack.Page do

	@moduledoc """

	This module contains the public API functions for interfacing with the Paystack's page endpoint.
	"""

	## body_params: A map with string keys
	## opts: Keyword list
	## slug_or_page_id: String
	## slug: String

	
	@endpoint "page/"

	## name field is required in the body_params while others are optional
	def create_page(body_params, opts \\ []) do		
		Paystack.request(:post, full_endpoint(), body_params, opts)
	end

	def list_pages(opts \\ []) do
		Paystack.request(:get, full_endpoint(), opts)
	end

	def fetch_page(slug_or_page_id, opts \\ []) do
		Paystack.request(:get, full_endpoint(slug_or_page_id), "", opts)
	end

	## All fields are optional. Only insert the fields you want to update.
	def update_page(slug_or_page_id, body_params, opts \\ []) do
		Paystack.request(:put, full_endpoint(slug_or_page_id), body_params, opts)
	end
	
	## this function returns whether a slug is available or not. If the slug is not
	## available, it says that the slug is already in use.
	def check_slug_availability(slug, opts \\ []) do
		Paystack.request(:get, full_endpoint("check_slug_availability/" <> "#{slug}"))
	end
    
  defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end
end
