class FavoritesController < ApplicationController

  def create
   @favorite = current_user.favorites.create(post_id: params[:post_id])
   @post = Post.find(params[:post_id])

  end

  def destroy
   @post = Post.find(params[:post_id])
   @favorite = current_user.favorites.find_by(post_id: @post.id)
   @favorite.destroy
  end


end
