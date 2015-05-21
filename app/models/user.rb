# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  account                :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  created_at             :datetime
#  updated_at             :datetime
#  admin_flag             :boolean          default(FALSE), not null
#  grade                  :integer          default(1), not null
#  email                  :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable, :recoverable
  validates_presence_of :name
  before_save :update_account!

  has_many :user_documents, dependent: :destroy
  has_many :documents, through: :user_documents

  include Grade

  def self.id_is(id)
    User.find_by(id: id.to_i)
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    params.delete(:password) if params[:password].blank?
    params.delete(:password_confirmation) if params[:password_confirmation].blank?

    clean_up_passwords
    update_attributes(params, *options)
  end

  def is_admin?
    admin_flag
  end

  private

  def update_account!
    self.account = email.match(/\A(.+)@/)[1]
  end
end
