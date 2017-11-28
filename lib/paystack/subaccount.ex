defmodule Paystack.Subaccount do 

    @moduledoc """

	This module contains the public API functions for interfacing with the Paystack's subaccount endpoint.
	"""
    ## body_params:  a map with string keys
	## opts: Keyword list
	## id: string

    @endpoint "subaccount/"

    ## Business name, settlement bank, account number and percentage charge field are required in the body while others are optional
    def create_subaccount( body_params \\ "", opts \\ [] ) do
        Paystack.request(:post, full_endpoint(), body_params, opts )
    end

    def list_subaccounts( opts \\ []) do
        Paystack.request(:get, full_endpoint(), opts)
    end

    def fetch_subaccount( id, opts \\ [] ) do
        Paystack.request(:get, full_endpoint(id), opts)
    end

    ## All fields are optional. Only insert the fields you want to update.
    def update_subaccount(body_params, id, opts \\ []) do
        Paystack.request(:put, full_endpoint(id), body_params, opts)
    end

    defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end
end
