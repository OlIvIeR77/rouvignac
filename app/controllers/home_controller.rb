class HomeController < ApplicationController
  def index
  	@gites = Gite.order(:title)
  end

  def sale

  end
end

