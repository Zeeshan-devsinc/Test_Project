# frozen_string_literal: true

class AddPlanRefToFeatures < ActiveRecord::Migration[5.2]
  def change
    add_reference :features, :plan, foreign_key: true
    # Features.update_all(plan_id: 1)
  end
end
