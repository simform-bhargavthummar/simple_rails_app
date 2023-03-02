class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
  end

  def create
   
    @comment = Comment.new(comment: params[:comment],
                          users_id: params[:users_id],
                          events_id: params[:events_id])
                          
    if @comment.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  
  end

  def comment_params 
    params.require(:comment).permit(:comment, :users_id, :events_id)
  end
end
