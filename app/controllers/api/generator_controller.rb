class Api::GeneratorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    short_url = UrlGenerationService.generate_short_url(generator_params[:full_url])
    # render json: { short_url: short_url }
  end

  private

  def generator_params
    params.permit(:long_url)
  end
end