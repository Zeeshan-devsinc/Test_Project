# frozen_string_literal: true

class AddSubscriptionRefToUsages < ActiveRecord::Migration[5.2]
  def change
    add_reference :usages, :subscription, foreign_key: true
  end
end
