# frozen_string_literal: true

class AddUserRefToUsages < ActiveRecord::Migration[5.2]
  def change
    add_reference :usages, :user, null: false, foreign_key: true
  end
end
