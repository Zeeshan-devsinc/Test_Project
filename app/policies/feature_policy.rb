# frozen_string_literal: true

class FeaturePolicy < ApplicationPolicy
  def create?
    user.role == 'admin'
  end

  def update?
    user.attributes['role'] == 'admin'
  end

  def destroy?
    user.attributes['role'] == 'admin'
  end
end
