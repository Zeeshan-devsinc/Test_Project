# frozen_string_literal: true

class FeaturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_plan, only: %i[index create new]
  before_action :set_feature, only: %i[show edit update destroy]

  def index
    @features = @plan.features
  end

  def show
    @usage = Usage.joins(subscription: :user)
                  .where(users: { id: current_user.id }, feature_id: @feature.id).first
  end

  def new
    @feature = @plan.features.new
  end

  def edit; end

  def create
    @feature = @plan.features.build(feature_params)
    authorize @feature

    if @feature.save
      redirect_to @feature.plan
    else
      render action: 'new'
    end
  end

  def update
    if @feature.update(feature_params)
      redirect_to([@feature.plan])
    else
      render action: 'edit'
    end
  end

  def destroy
    @plan = @feature.plan
    @feature.destroy
    redirect_to @plan
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_feature
    @feature = Feature.find_by(params[:id])
  end

  def feature_params
    params.require(:feature).permit(:subscription_id, :name, :code, :unit_price, :max_unit_limit)
  end
end
