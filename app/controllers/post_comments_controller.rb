class PostCommentsController < ApplicationController
  before_action :require_login
  def index
    @comments = PostComment.where( post_id: params[:post_id] )
  end

  def new
    @comment = PostComment.new
  end

  def create
    @comment = PostComment.new(comment_params) 
    if @comment.save
      respond_to do |format|
        format.html { redirect_to comment_path(params[:post_id]) }
        format.turbo_stream
      end
    else
      render :new, status: 422
    end
  end

  def all_comments
    @comments = PostComment.all
  end

  def post_comments
    @comments = PostComment.where(post_id: params[:id] )
  end

  private
    def comment_params
      params.require(:post_comment).permit(:comment, :post_id )
    end
end
