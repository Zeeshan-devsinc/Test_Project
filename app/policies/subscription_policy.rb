# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def create?
    user.role == 'buyer'
  end
end
