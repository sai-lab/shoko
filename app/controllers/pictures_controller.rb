class PicturesController < ApplicationController
  before_action :authenticate_user!

  def create
    @pictures = []

    params[:files].each do |file|
      picture = Picture.new attachment: file

      if picture.save
        @pictures << picture
        data = {
          url: picture.attachment.url,
          file_name: picture.attachment_file_name
        }
        WebsocketRails[current_user.account].trigger :create_picture, data
      end
    end

    render nothing: true
  end
end
