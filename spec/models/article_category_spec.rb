# == Schema Information
#
# Table name: article_categories
#
#  id          :integer          not null, primary key
#  article_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
