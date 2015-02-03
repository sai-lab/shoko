# == Schema Information
#
# Table name: user_documents
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  document_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserDocument < ActiveRecord::Base
  belongs_to :user
  belongs_to :document
end
