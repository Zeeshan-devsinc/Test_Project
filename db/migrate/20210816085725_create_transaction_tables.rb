# frozen_string_literal: true

class CreateTransactionTables < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_tables do |t|
      t.integer :subscription_charges
      t.integer :Overuse_charges
      t.integer :month
      t.references :subscription, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
