class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
   
    @comment = Comment.new(comment_params)
                          
    if @comment.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  
  end

  def comment_params 
    params.require(:comment).permit(:comment, :user_id, :event_id)
  end
end
