class Api::GeneratorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    long_url = LongUrl.find_or_create_by(url: generator_params[:long_url])
    urls = UrlGenerationService.generate_short_url(long_url)
    render json: urls
  end

  private

  def generator_params
    params.permit(:long_url)
  end
end