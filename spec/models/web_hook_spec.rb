# == Schema Information
#
# Table name: web_hooks
#
#  id         :integer          not null, primary key
#  url        :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe WebHook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
