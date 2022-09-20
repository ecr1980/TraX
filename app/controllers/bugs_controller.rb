class BugsController < ApplicationController
  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(bug_params)
    @bug.user_id = current_user.id
    @bug.open = true
    if @bug.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

  private

  def bug_params
    params.require(:bug).permit(:description, :steps, :severity, :version)
  end

end
