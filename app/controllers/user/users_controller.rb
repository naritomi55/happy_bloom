class User::UsersController < ApplicationController

  def show
    if params[:format].present?
      @user = User.find(params[:format])
    else
      @user = current_user
    end
    #byebug
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    current_user.update(user_params)
    redirect_to users_my_page_path
  end
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_image_id)
    # binding.pry
    @favorite_posts = PostImage.find(favorites)

  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
