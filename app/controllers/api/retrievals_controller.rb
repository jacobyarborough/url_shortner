class Api::RetrievalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    urls = UrlRetrievalService.get_short_url(retrieval_params[:url])
    render json: urls
  end

  private

  def retrieval_params
    params.permit(:url)
  end
end