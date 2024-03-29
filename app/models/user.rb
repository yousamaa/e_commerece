# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :coupons, dependent: :destroy

  validates :name, :email, presence: true

  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    avatar
  end

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'default_profile.jpg'
        )
      ), filename: 'default_profile.jpg', content_type: 'image/jpg'
    )
  end
end
