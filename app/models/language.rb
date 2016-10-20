class Language < ApplicationRecord
  belongs_to :user, inverse_of: :languages
end
