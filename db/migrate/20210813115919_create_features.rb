# frozen_string_literal: true

class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.string :code
      t.integer :unit_price
      t.integer :max_unit_limit

      t.timestamps
    end
  end
end
