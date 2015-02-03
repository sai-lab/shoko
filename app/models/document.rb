# == Schema Information
#
# Table name: documents
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  markdown   :text             default(""), not null
#  draft_flag :boolean          default("false"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Document < ActiveRecord::Base
  validates_presence_of :title, :markdown

  has_many :user_documents
  has_many :users, through: :user_documents

  scope :draft, -> { where(draft_flag: true) }
  scope :publish, -> { where(draft_flag: false) }

  def self.id_is(id)
    Document.where(id: id.to_i).first
  end
end
