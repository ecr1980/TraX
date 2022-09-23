class HomeController < ApplicationController
  def index
    @bugs = bug_on_or_off()
    @bugs = bug_sort(@bugs)
  end

  private

  def bug_on_or_off()
    if params[:closed] == "on"
      bugs = Bug.all
    else
      bugs = Bug.all.where(open: true)
    end
    return bugs
  end

  def bug_sort(bugs)
    case params[:sort]
    when "newest"
      bugs = bugs.sort_by { |bug| bug.created_at }.reverse
    when "oldest"
      bugs = bugs.sort_by { |bug| bug.created_at }
    when "severity"
      bugs = bugs.sort_by { |bug| bug.severity }.reverse
    when "user"
      bugs = bugs.sort_by { |bug| bug.user_id }
    when "version"
      bugs = bugs.sort_by { |bug| bug.version }
    else
      bugs = bugs.sort_by { |bug| bug.severity }.reverse
    end
    return bugs
  end

end
