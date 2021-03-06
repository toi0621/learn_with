class PostsController < ApplicationController

  def new
   @post = Post.new
  end

  def edit
   @post = Post.find(params[:id])
   unless @post.user == current_user
    redirect_to posts_path
   end
  end

  def create
   @post = Post.new(post_params)
   @post.user_id = current_user.id
   if @post.save
    flash[:notice] = 'You have created post successfully.'
    redirect_to post_path(@post)
   else
    # @posts = Post.all
    # @user = current_user
    render :new
   end
  end

  def update
   @post = Post.find(params[:id])
   if @post.update(post_params)
    flash[:notice] = 'You have updated post successfully.'
    redirect_to  post_path(@post)
   else
    render :edit
   end

  end

  def index
   if params[:genre].present?
     @posts = Post.where(genre: params[:genre]).page(params[:page]).per(10)
   else
     @posts = Post.all.page(params[:page]).per(10)
   end
   @user = current_user
   @post = Post.new
  end

  def show
   @postnew = Post.new
   @post = Post.find(params[:id])
   @user = User.find(@post.user_id)
   @comment = Comment.new

  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to posts_path
  end

  private

  def post_params
   params.require(:post).permit(:title, :body, :genre_id)
  end


end
