class HomeController < ApplicationController
  def index
    @evaluateds = Evaluated.all
  end
end