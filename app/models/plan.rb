# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :features, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  validates :name, presence: true
  validates :monthly_fee, presence: true
end
