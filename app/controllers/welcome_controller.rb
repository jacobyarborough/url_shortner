class WelcomeController < ApplicationController
  def index
    @long_url = LongUrl.new
  end
end