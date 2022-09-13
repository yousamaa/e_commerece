# frozen_string_literal: true

class CouponUser < ApplicationRecord
  belongs_to :user
  belongs_to :coupon
end
