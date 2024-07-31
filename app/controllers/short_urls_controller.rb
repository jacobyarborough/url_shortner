class ShortUrlsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @long_url = LongUrl.new
  end

  def create
    long_url = LongUrl.find_or_create_by(url: url_params[:url])
    @urls = UrlGenerationService.generate_short_url(long_url)
    
    if session[:urls]
      url_array = session[:urls]
      url_array.push(@urls)
      session[:urls] = url_array
    else
      session[:urls] = [@urls]
    end

    redirect_to root_path
  end

  private

  def url_params
    params.require(:long_url).permit(:url)
  end
end