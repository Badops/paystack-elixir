defmodule Paystack.Bulkcharge do

    @moduledoc """

	This module contains the public API functions for interfacing with the Paystack's subaccount endpoint.
	"""
    ## body_params:  a map with string keys
	## opts: Keyword list
	## id: string

    @endpoint "bulkcharge/"

    ## authentication and amount field are required in the body while others are optional
    
    def initial_bulkcharge(body_params \\ []) do
        Paystack.request(:post, full_endpoint(), body_params)

    end

    def list_bulkcharge_batches(opts \\ []) do
        Paystack.request(:get, full_endpoint(), opts)
    end

    def fetch_bulkcharge_batches( id ) do
        Paystack.request(:get, full_endpoint(id))
    end

    def fetch_charges_batch( id ) do
        Paystack.request(:get, full_endpoint(id) <> "/charges")
    end

    def pause_bulkcharge( id ) do
        Paystack.request(:get,  full_endpoint("pause/" <> id))
    end

    def resume_bulkcharge( id ) do
        Paystack.request(:get, full_endpoint("resume/" <> id))
    end

    defp full_endpoint(endpoint \\ "") do
		@endpoint <> endpoint
	end
end