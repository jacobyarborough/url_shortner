class RedirectsController < ApplicationController
  def show
    full_url = ShortUrl.find_by(base58: url_params[:base58]).long_url.full_url
    redirect_to full_url, allow_other_host: true, status: :moved_permanently
  end

  private

  def url_params
    params.permit(:base58)
  end
end