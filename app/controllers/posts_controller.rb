class PostsController < ApplicationController
  before_action :require_login
  def index
    @posts = Post.where(post_user_id: @current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params) 
      if @post.save
        respond_to do |format|
          format.html { redirect_to posts_path }
          format.turbo_stream
        end
      else
        render :new, status: 422
      end
   
  end

  def edit
    get_post
  end

  def update
    get_post
    if @post.update(post_params)
      redirect_to posts_path 
    else
      render :edit, status: 422 
    end
  end

  def destroy
    get_post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.turbo_stream
    end
  end

  def all_post
    @posts = Post.all
  end

  def like_post
    @like = PostLike
      .find_or_initialize_by(
        post_user_id: current_user.id,
        post_id: params[:id])
        
      if @like.new_record? && @like.save
        flash[:notice] = "You liked the post."
      else 
        flash[:notice] = "You already liked the post."
      end
    redirect_to all_post_path
  end

  def dislike_post
    @like = PostLike.find_by(post_user_id: current_user.id,
      post_id: params[:id])
      if @like
        @like.destroy
        flash[:notice] = "You disliked the post."
      else 
        flash[:notice] = "You already disliked liked the post."
      end 
    redirect_to all_post_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :post_user_id)
    end

    def get_post
      @post = Post.find(params[:id])
    end
end
