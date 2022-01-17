# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  def create?
    user.attributes['role'] == 'admin'
  end

  def update?
    user.attributes['role'] == 'admin'
  end

  def destroy?
    user.attributes['role'] == 'admin'
  end
end
