class RedirectsController < ApplicationController
  def show
    short_url_identifier = UrlGenerator.decode_base_58(url_params[:base58])
    long_url = ShortUrl.find_by(identifier: short_url_identifier).long_url.url
    redirect_to long_url, allow_other_host: true, status: :moved_permanently
  end

  private

  def url_params
    params.permit(:base58)
  end
end