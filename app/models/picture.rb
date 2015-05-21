# == Schema Information
#
# Table name: pictures
#
#  id                      :integer          not null, primary key
#  attachment_file_name    :string
#  attachment_content_type :string
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Picture < ActiveRecord::Base
  has_attached_file :attachment,
    url: '/pictures/:hash.:extension',
    path: "#{Rails.root}/public/pictures/:hash.:extension",
    hash_secret: 'longSecretString'

  validates_attachment :attachment,
    presence: true,
    content_type: { content_type: /(image|application)\/(jpeg|png|gif|pdf)/ }

  def self.id_is(id)
    find_by(id: id.to_i)
  end

  def pdf_url
    image_path = attachment.url.gsub('.pdf', '.png')
    absolute_image_path = attachment.path.gsub('.pdf', '.png')
    return image_path if File.exists?(absolute_image_path)
    pdf = Magick::ImageList.new(attachment.path + '[0]')
    cover_tmp = absolute_image_path
    pdf[0].write(cover_tmp)
    image_path
  end

  def destroy
    destroy_pdf_image
    super
  end

  def destroy_pdf_image
    return unless attachment_content_type == 'application/pdf'
    file_path = attachment.path.gsub('.pdf', '.png')
    File.delete(file_path) if File.exists?(file_path)
  end
end
