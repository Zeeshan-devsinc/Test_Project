# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription, only: %i[edit update destroy]

  def index
    @subscriptions = current_user.subscriptions if current_user.role == 'buyer'

    if current_user.role == 'admin'
      @user = User.find(params[:user_id])
      @subscriptions = @user.subscriptions
    end
  end

  def new
    @subscription = current_user.subscriptions.new
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def update
    if @subscription.update
      redirect_to current_user.plans
    else
      render 'edit'
    end
  end

  def edit; end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    authorize @subscription

    if @subscription.save
      redirect_to @subscription
    else
      render 'new'
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    redirect_to user_subscriptions_path(current_user.subscriptions),
                notice: "Subscription #{@subscription.id} Cancelled"
  end

  private

  def subscription_params
    params.require(:subscription).permit(:plan_id, :user_id)
  end

  def set_subscription
    @subscription = current_user.subscriptions.find(params[:id])
  end
end
