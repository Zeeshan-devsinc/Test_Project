# frozen_string_literal: true

class RemUserRefFromUsages < ActiveRecord::Migration[5.2]
  def change
    remove_column :usages, :user_id, :integer
  end
end
