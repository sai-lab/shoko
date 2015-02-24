class TopController < ApplicationController
  def index
    redirect_to documents_path if user_signed_in?
  end
end
