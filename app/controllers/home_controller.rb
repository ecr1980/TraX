class HomeController < ApplicationController
  def index
    @bugs = Bug.all.where(open: true)
    @bugs = @bugs.sort_by { |bug| bug.severity }.reverse
  end
end
