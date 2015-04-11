# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  markdown   :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           default(""), not null
#  pattern    :string           default("")
#

class Template < ActiveRecord::Base
  validates_presence_of :name, :title, :markdown

  scope :id_is, ->(id) { find_by(id: id.to_i) }

  def replace_title(user)
    day = Time.now
    title.gsub! '%{year}', day.strftime('%y')
    title.gsub! '%{month}', day.strftime('%m')
    title.gsub! '%{day}', day.strftime('%d')
    title.gsub! '%{account}', user.account
    title.gsub! '%{name}', user.name
  end
end
