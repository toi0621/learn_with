class UsersController < ApplicationController
  
  def show
   @user = User.find(params[:id])
   @posts = Post.where(user_id: @user.id)
   @post = Post.new
  end

  def index
   @users = User.all
   @user = current_user
   @post = Post.new
   @usered = User.where.not(id: current_user.id)

  end

  def edit
   @user = User.find(params[:id])
   if @user.id == current_user.id
    render :edit
   else
    redirect_to user_path(current_user)
   end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = 'You have updatd user successfully.'
    redirect_to  user_path(@user)
   else
    render :edit
   end
  end

  def followings
   user = User.find(params[:id])
   @users = user.followings
  end

  def followers
   user = User.find(params[:id])
   @users = user.followers
  end 


  private

   def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
   end

end
