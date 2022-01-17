# frozen_string_literal: true

class TransactionTablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subscription
  before_action :set_transaction_table, only: %i[show edit update destroy]

  def index
    @transaction_tables = @subscription.transaction_tables.build
  end

  def new
    @transaction_table = @subscription.transaction_tables.build(transaction_table_params)
  end

  def create
    @transaction_table = @subscription.transaction_tables.build(transaction_table_params)
    if @transaction_table.save
      redirect_to @transaction_table
    else
      render action: 'new'
    end
  end

  def edit; end

  def update
    if @transaction_table.update(transaction_table_params)
      redirect_to @transaction_table
    else
      render action: 'edit'
    end
  end

  def show; end

  def destroy
    @transaction_table.destroy
    redirect_to @transaction_table
  end

  private

  def transaction_table_params
    params.require(:transaction_table).permit(:subscription_charges, :Overuse_charges, :month, :feature_id,
                                              :subscription_id)
  end

  def set_subscription
    @subscription = current_user.find(params[:subscription_id])
  end

  def set_transaction_table
    @transaction_table = @subscription.transaction_tables.find(params[:id])
  end
end
