# frozen_string_literal: true

class User < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions, dependent: :destroy

  scope :user_role, -> { where("role == 'buyer' ") }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: %w[admin buyer] }

  ROLE_OPTIONS = [
    %w[Admin admin],
    %w[Buyer buyer]
  ].freeze

  def admin?
    role == 'admin'
  end

  def buyer?
    role == 'buyer'
  end
end
