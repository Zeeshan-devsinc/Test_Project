# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role billing_day])
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  # private

  # def user_not_authorized
  #     policy_name = exception.policy.class.to_s.underscore

  #     flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
  #     redirect_to root_path
  # end
end
