class HomeController < ApplicationController
  def index
    @positions = Positions.all
  end
end
