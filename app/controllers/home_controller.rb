class HomeController < ApplicationController
  def index
    @keyword = keyword_filter()
    @bugs = bug_conditions().uniq()
    @bugs = bug_sort(@bugs)
  end

  private

  def bug_conditions()
    if @keyword == nil
      bug = Bug.all
    else
      bug = keyword_included_bugs()
      return bug
    end
    if params[:closed] == "on"
      return bug
    else
      bugs = bug.all.where(open: true)
      return bugs
    end
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

  def keyword_filter()
    if params[:word] && params[:word] != ""
      word = params[:word].downcase
      removed_commas_word = word.gsub(",", "")
      if removed_commas_word != nil
        word = removed_commas_word
      end
      keyword_array = word.split(" ")
      return keyword_array
    end
    return nil
  end

  def keyword_included_bugs()
    bugs = Array.new
    temp_bugs = Bug.all
    @keyword.each do |word|
      temp_bugs.each do |bug| 
        if bug.keywords.include? word
          bugs << bug
        end
      end
    end
    return bugs
  end
end
