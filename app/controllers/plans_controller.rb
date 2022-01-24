# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: %i[show edit update destroy]
  before_action :authorize, only: %i[edit update]

  def index
    role = current_user.role
    @plans = if role == 'buyer'
               Plan.joins(:features).distinct
             else
               Plan.all
             end
    @users = User.user_role
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to @plan
    else
      render action: 'new'
    end
  end

  def show
    # @subscription = Subscription.find(params[:id])
  end

  def edit; end

  def new
    @plan = Plan.new
  end

  def update
    if @plan.update(plan_params)
      redirect_to @plan
    else
      render action: 'edit'
    end
  end

  def destroy
    authorize @plan
    @plan.destroy
    redirect_to @plan
  end

  private

  def plan_params
    params.require(:plan).permit(:subscription_id, :name, :monthly_fee)
  end

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def authorize_plan
    authorize @plan
  end
end
