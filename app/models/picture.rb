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
    content_type: { content_type: /^image\/(jpeg|png|gif)/ }

  scope :id_is, ->(id) { find_by(id: id.to_i) }
end
