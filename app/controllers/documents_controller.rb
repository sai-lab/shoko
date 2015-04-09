class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_document

  def index
    @users = User.all

    if params[:user].present?
      @documents = User.id_is(params[:user]).documents
    else
      @documents = Document.all
    end

    if params[:draft]
      @documents = @documents.draft
    else
      @documents = @documents.publish
    end

    if params[:title].present?
      params[:title].split(' ').each do |title|
        @documents = @documents.search_title title
      end
    end

    if params[:keyword].present?
      params[:keyword].split(' ').each do |keyword|
        @documents = @documents.search_markdown keyword
      end
    end

    @documents = @documents.order(updated_at: :desc).page(params[:page]).per(5)
  end

  def show
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
      if @document.is_draft?
        flash[:notice] = 'ドキュメントを下書きしました。'
      else
        @document.create_markdown
        flash[:notice] = 'ドキュメントを公開しました。'
      end
    end

    render :submit
  end

  def edit
    @templates = Template.order(:id).each do |template|
      template.replace_title current_user
    end
  end

  def update
    old_title = @document.title
    @result = @document.update document_params

    if @result
      unless @document.users.id_is(current_user.id)
        @document.user_documents.create user_id: current_user.id
      end

      @document.update_markdown old_title
      flash[:notice] = 'ドキュメントを更新しました。'
    end

    render :submit
  end

  def delete
  end

  def destroy
    @document.destroy_markdown
    @result = @document.destroy

    if @result
      flash[:notice] = 'ドキュメントを削除しました。'
    else
      flash[:alert] = 'ドキュメントを削除できませんでした。'
    end

    redirect_to documents_path
  end

  private

  def load_document
    @document = Document.id_is(params[:id]) if params[:id]
  end

  def document_params
    params.require(:document).permit :title, :markdown, :draft_flag
  end
end
