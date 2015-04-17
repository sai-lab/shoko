class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :load_user

  def index
    @users = User.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def show
    @documents = @user.documents.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @result = @user.save
    flash[:notice] = 'ユーザを作成しました。' if @result
    render :submit
  end

  def edit
  end

  def update
    @result = @user.update_without_current_password user_params
    flash[:notice] = 'ユーザを更新しました。' if @result
    render :submit
  end

  def delete
  end

  def destroy
    @result = @user.destroy

    if @result
      flash[:notice] = 'ユーザを削除しました。'
    else
      flash[:alert] = 'ユーザを削除できませんでした。'
    end

    redirect_to admin_users_path
  end

  private

  def load_user
    @user = User.id_is(params[:id]) if params[:id]
  end

  def user_params
    params.require(:user).permit :email, :name, :grade, :password, :password_confirmation, :admin_flag
  end
end
