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

  scope :draft, -> { where(draft_flag: true) }
  scope :publish, -> { where(draft_flag: false) }

  def self.id_is(id)
    Document.where(id: id.to_i).first
  end

  def self.search_title(keyword)
    where 'title LIKE ?', "%#{escape_like keyword}%"
  end

  def self.search_markdown(keyword)
    where 'markdown LIKE ?', "%#{escape_like keyword}%"
  end

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
