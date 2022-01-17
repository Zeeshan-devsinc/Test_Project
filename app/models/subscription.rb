# frozen_string_literal: true

class Subscription < ApplicationRecord
  has_many :transaction_tables, dependent: :destroy
  has_many :usages, dependent: :destroy
  belongs_to :user
  belongs_to :plan

  after_create :create_usages

  def create_usages
    plan&.features&.each do |feature|
      usages.create(feature_id: feature.id)
    end
  end
end
