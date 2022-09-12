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
      flash[:alret] = "画像を選択してください"
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page]).search(params[:search])
    @post_images = @post_images.where("introduction LIKE ? ", '%' + params[:search] + '%') if params[:search].present?

    if params[:search].present? && Tag.find_by(name: params[:search]).present?
      post_image_ids = []
      Tag.find_by(name: params[:search]).post_image.each do |p|
        post_image_ids << p.id
      end
      post_image_ids = post_image_ids.uniq

      @post_images = PostImage.where(id: post_image_ids).page(params[:page]) if post_image_ids.present?
    end

    unless @post_images.present?
      @post_images = PostImage.all.page(params[:page])
    end

    if params[:tag_ids].present?
      post_image_ids = []
      params[:tag_ids].each do |key, value|
        if value == "1"
          Tag.find_by(name: key).post_image.each do |p|
            post_image_ids << p.id
          end
        end
      end
      post_image_ids = post_image_ids.uniq
      @post_images = @post_images.where(id: post_image_ids) if post_image_ids.present?
    end

    # binding.pry
    # pp @post_images
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to post_image_path(@post_image.id)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end


  private
  def post_image_params
    params.require(:post_image).permit(:title, :introduction, :image, tag_ids: [])
  end

end
