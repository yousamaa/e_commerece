class Product < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :delete_all
  has_many :carts, through: :cart_items
  validates :name, :price, presence: true
end
