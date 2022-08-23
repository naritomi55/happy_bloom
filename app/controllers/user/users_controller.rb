class User::UsersController < ApplicationController

  def show

  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    current_user.update(user_params)
    redirect_to users_my_page_path
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

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
