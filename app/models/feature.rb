# frozen_string_literal: true

class Feature < ApplicationRecord
  belongs_to :plan
  has_many :usages, dependent: :destroy
  has_many :transaction_tables, dependent: :destroy

  validates :name, presence: true
  validates :code, presence: true
  validates :unit_price, presence: true
  validates :max_unit_limit, presence: true
end
