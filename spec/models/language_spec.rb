# == Schema Information
#
# Table name: languages
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string(200)
#  description  :text
#  url_language :string(200)
#  obtained     :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Language, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
