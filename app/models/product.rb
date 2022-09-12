# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :cart_items, dependent: :destroy
  validates :name, :price, presence: true
end
