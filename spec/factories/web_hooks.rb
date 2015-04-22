# == Schema Information
#
# Table name: web_hooks
#
#  id         :integer          not null, primary key
#  url        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :web_hook do
    
  end

end
