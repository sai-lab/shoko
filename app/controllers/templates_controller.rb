class TemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_template

  def index
    @templates = Template.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new template_params
    @result = @template.save
    flash[:notice] = 'テンプレートを作成しました。'
  end

  def edit
  end

  def update
    @result = @template.update template_params
    flash[:notice] = 'テンプレートを更新しました。'
  end

  def delete
  end

  def destroy
    @result = @template.destroy

    if @result
      flash[:notice] = 'テンプレートを削除しました。'
    else
      flash[:alert] = 'テンプレートを削除できませんでした。'
    end

    render :reload
  end

  def select
    @template.replace_title current_user
  end

  private

  def load_template
    @template = Template.id_is(params[:id]) if params[:id]
  end

  def template_params
    params.require(:template).permit :title, :markdown
  end
end
