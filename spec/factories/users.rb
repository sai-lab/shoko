# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  account            :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  name               :string           default(""), not null
#  created_at         :datetime
#  updated_at         :datetime
#  admin_flag         :boolean          default(FALSE), not null
#  grade              :integer          default(1), not null
#

FactoryGirl.define do
  factory :user do
    
  end

end
