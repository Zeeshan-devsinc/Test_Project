# frozen_string_literal: true

class CreateUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :usages do |t|
      t.integer :units_used
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
