class HomeController < ApplicationController
  def index
  	@gites = Gite.all
  end
end
