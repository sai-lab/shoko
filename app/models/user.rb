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
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable
  validates_uniqueness_of :account
  validates_presence_of :account, :name

  has_many :user_documents
  has_many :documents, through: :user_documents

  def self.id_is(id)
    User.where(id: id.to_i).first
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
