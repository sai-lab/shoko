# == Schema Information
#
# Table name: web_hooks
#
#  id         :integer          not null, primary key
#  url        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           default(""), not null
#

class WebHook < ActiveRecord::Base
  validates_presence_of :name, :url

  def self.id_is(id)
    find_by(id: id.to_i)
  end
end
