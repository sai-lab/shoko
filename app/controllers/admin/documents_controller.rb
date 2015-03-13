class Admin::DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!
  before_action :load_document

  def show
  end

  private

  def load_document
    @document = Document.id_is(params[:id]) if params[:id]
  end
end
