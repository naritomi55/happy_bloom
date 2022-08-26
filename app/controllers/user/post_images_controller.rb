class User::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    post_image = PostImage.new(post_image_params)
    post_image.user_id = current_user.id
    if post_image.save
      redirect_to post_image_path(post_image.id)
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
  end

  def show
  end

  private
  def post_image_params
    params.require(:post_image).permit(:title, :introduction, :image)
  end

end
