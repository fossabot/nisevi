# frozen_string_literal: true

module Stringify
  extend ActiveSupport::Concern

  def shorten_description(default=90)
    description.length > default ? "#{description[0..default]}..." : description
  end
end
