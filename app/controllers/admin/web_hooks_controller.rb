class Admin::WebHooksController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :load_web_hook

  def index
    @web_hooks = WebHook.order(updated_at: :desc).page(params[:page]).per(20)
  end

  def show
  end

  def new
    @web_hook = WebHook.new
  end

  def create
    @web_hook = WebHook.new web_hook_params
    @result = @web_hook.save
    flash[:notice] = 'WebHookを作成しました。' if @result
    render :submit
  end

  def edit
  end

  def update
    @result = @web_hook.update web_hook_params
    flash[:notice] = 'WebHookを更新しました。' if @result
    render :submit
  end

  def delete
  end

  def destroy
    @result = @web_hook.destroy

    if @result
      flash[:notice] = 'WebHookを削除しました。'
    else
      flash[:alert] = 'WebHookを削除できませんでした。'
    end

    redirect_to admin_web_hooks_path
  end

  private

  def load_web_hook
    @web_hook = WebHook.id_is(params[:id]) if params[:id]
  end

  def web_hook_params
    params.require(:web_hook).permit :url
  end
end
