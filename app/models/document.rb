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

class Document < ActiveRecord::Base
  validates_presence_of :title, :markdown

  has_many :user_documents, dependent: :destroy
  has_many :users, through: :user_documents

  scope :id_is, ->(id) { find_by(id: id.to_i) }
  scope :draft, -> { where(draft_flag: true) }
  scope :publish, -> { where(draft_flag: false) }
  scope :search_title, ->(keyword) { keyword ? Document.where(['title LIKE ?', "%#{PGconn.escape(keyword)}%"]) : Document.all }
  scope :search_markdown, ->(keyword) { keyword ? Document.where(['markdown LIKE ?', "%#{PGconn.escape(keyword)}%"]) : Document.all }

  def create_markdown
    FileJob.perform_later id, nil
  end

  def update_markdown(old_title)
    FileJob.perform_later id, old_title
  end

  def destroy_markdown
    FileJob.perform_later nil, title
  end

  def is_draft?
    draft_flag
  end

  def is_publish?
    !draft_flag
  end
end
