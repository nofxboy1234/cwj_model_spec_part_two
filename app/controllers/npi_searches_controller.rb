# app/controllers/npi_searches_controller.rb

ENDPOINT_URL = "https://npiregistry.cms.hhs.gov/api"
TARGET_VERSION = "2.1"

class NPISearchesController < ApplicationController
  def new
    @results = []
    return unless params[:first_name].present? || params[:last_name].present?

    query_string = {
      first_name: params[:first_name],
      last_name: params[:last_name],
      version: TARGET_VERSION,
      address_purpose: ""
    }.to_query

    uri = URI("#{ENDPOINT_URL}/?#{query_string}")
    response = Net::HTTP.get_response(uri)
    @results = JSON.parse(response.body)["results"]
  end
end