# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :user

  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  validates :name, :price, :description, presence: true
  validates :name, uniqueness: true
end
