class TopController < ApplicationController
  def index
    redirect_to documents_path if current_user
  end
end
