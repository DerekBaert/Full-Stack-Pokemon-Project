class HomeController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end
end
