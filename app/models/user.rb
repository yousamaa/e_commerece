# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cart, dependent: :destroy
  has_many :coupons, through: :coupon_users
  validates :name, :email, presence: true

  after_commit :add_default_avatar, on: %i[create update]

  def avatar_thumbnail
    if avatar.attached?
      avatar
    else
      'default_profile.jpg'
    end
  end

  private

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
