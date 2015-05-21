class PicturesController < ApplicationController
  before_action :authenticate_user!

  def create
    @pictures = []

    params[:files].each do |file|
      picture = Picture.new attachment: file

      if picture.save
        @pictures << picture
        if attachment_content_type = 'application/pdf'
          data = {
            image: picture.pdf_url,
            url: picture.attachment.url,
            file_name: picture.attachment_file_name
          }
        else
          data = {
            image: picture.attachment.url,
            url: picture.attachment.url,
            file_name: picture.attachment_file_name
          }
        end
        WebsocketRails[current_user.account].trigger :create_picture, data
      end
    end

    render nothing: true
  end
end
