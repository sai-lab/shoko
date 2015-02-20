# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  markdown   :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Template < ActiveRecord::Base
  validates_presence_of :title, :markdown

  def self.id_is(id)
    Template.where(id: id.to_i).first
  end

  def replace_title(user_name)
    day = Time.now
    title.gsub! '%{year}', day.strftime('%y')
    title.gsub! '%{month}', day.strftime('%m')
    title.gsub! '%{day}', day.strftime('%d')
    title.gsub! '%{name}', user_name
  end
end
