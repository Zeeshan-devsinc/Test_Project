# frozen_string_literal: true

class Usage < ApplicationRecord
  belongs_to :feature
  belongs_to :subscription
end
