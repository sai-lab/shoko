class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_document

  def index
    if params[:draft]
      @documents = Document.draft
    else
      @documents = Document.publish
    end
    @documents = @documents.search_created_at(params[:date])  if params[:date].present?
    @documents = @documents.search_title(params[:title])      if params[:title].present?
    @documents = @documents.search_markdown(params[:keyword]) if params[:keyword].present?
    @documents = @documents.order(updated_at: :desc).page(params[:page]).per(10)
  end

  def show
    if @document.draft? && !current_user.have?(@document.id)
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  def new
    @document = Document.new
    @templates = Template.order(:id).each do |template|
      template.replace_title current_user
    end
  end

  def create
    @document = Document.new document_params
    @result = @document.save
    if @result
      @document.user_documents.create user_id: current_user.id
      if @document.draft?
        flash[:notice] = 'ドキュメントを下書きしました。'
      else
        flash[:notice] = 'ドキュメントを公開しました。'
      end
    end
  end

  def edit
    @templates = Template.order(:id).each do |template|
      template.replace_title current_user
    end
  end

  def update
    @result = @document.update document_params
    if @result
      unless @document.users.id_is(current_user.id)
        @document.user_documents.create user_id: current_user.id
      end
      flash[:notice] = 'ドキュメントを更新しました。'
    end
  end

  def delete
  end

  def destroy
  end

  private

  def load_document
    @document = Document.id_is(params[:id]) if params[:id]
  end

  def document_params
    params.require(:document).permit :title, :markdown, :draft_flag
  end
end
