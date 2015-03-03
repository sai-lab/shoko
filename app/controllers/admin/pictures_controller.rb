class Admin::PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :load_picture

  def index
    @pictures = Picture.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def delete
  end

  def destroy
    @result = @picture.destroy

    if @result
      flash[:notice] = '画像を削除しました。'
    else
      flash[:alert] = '画像を削除できませんでした。'
    end

    redirect_to admin_pictures_path
  end

  private

  def load_picture
    @picture = Picture.id_is(params[:id]) if params[:id]
  end
end
