class HomeController < ApplicationController
  def index
    @bugs = Bug.all
  end
end
