class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.body != ""
      if @comment.save
        if @comment.closed == true
          @comment.bug.open = false
          @comment.bug.save
        end
        redirect_to bug_path(@comment.bug_id)
      else
        redirect_to bug_path(@comment.bug_id)
      end
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :bug_id, :closed)
  end
end
