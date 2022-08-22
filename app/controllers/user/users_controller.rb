class User::UsersController < ApplicationController

  def show

  end

  def edit

  end

  def update

  end

  def confirm

  end

  def withdraw

  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_images_id)
    @favorite_posts = PostImage.find(favorites)
  end

end
