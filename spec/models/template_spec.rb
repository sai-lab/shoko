# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  markdown   :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           default(""), not null
#  pattern    :string           default("")
#

require 'rails_helper'

RSpec.describe Template, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
