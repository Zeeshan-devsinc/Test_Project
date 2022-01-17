# frozen_string_literal: true

class UsagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feature, only: %i[index new create]
  before_action :set_usage, only: %i[show edit update destroy]

  def index
    @usages = @feature.usages
  end

  def create
    @usage = @feature.usages.build(usage_params)
    if @usage.save
      redirect_to([@usage.feature])
    else
      render action: 'new'
    end
  end

  def new
    @usage = @feature.usages.build
  end

  def edit
    @usage = Usage.find_by(subscription_id: usage_params[:subscription_id], feature_id: params[:id])
  end

  def update
    if @usage.update(usage_params)
      redirect_to @feature
    else
      render action: 'edit'
    end
  end

  def show; end

  def destroy
    @usage.destroy
    redirect_to @feature.plan
  end

  private

  def set_feature
    @feature = Feature.find(params[:feature_id])
  end

  def set_usage
    @usage = Usage.find(params[:id])
  end

  def usage_params
    params.require(:usage).permit(:subscription_id, :units_used)
  end
end
