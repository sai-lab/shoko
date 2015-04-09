# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  markdown   :text             default(""), not null
#  draft_flag :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :document do
    
  end

end
