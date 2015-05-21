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
    Picture.find_by(id: id.to_i)
  end

  def pdf_url
    file_path = attachment.url.to_s.split('.pdf')[0] + '.png'
    return file_path if File.exists?(Rails.root.to_s + '/public' + file_path)

    pdf = Magick::ImageList.new(Rails.root.to_s + '/public' + attachment.url.to_s.split('?')[0] + '[0]')
    cover_tmp = Rails.root.to_s + '/public' + file_path
    pdf[0].write(cover_tmp)
    file_path
  end
end
