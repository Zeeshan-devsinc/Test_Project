# frozen_string_literal: true

class TransactionTable < ApplicationRecord
  belongs_to :subscription
  belongs_to :feature
end
