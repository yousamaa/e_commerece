# frozen_string_literal: true

module CartsHelper
  def total_bill(cart)
    coupon_user = CouponUser.find_by(user_id: cart.user_id, coupon_id: 1)
    sum = 0
    cart.cart_items.each do |cart_item|
      sum += cart_item.product.price * cart_item.quantity
    end
    return sum - (sum * discount(coupon_user)) unless coupon_user.nil? || coupon_valid_till(coupon_user) < DateTime.now

    sum
  end

  def discount(coupon_user)
    coupon_user.coupon.discount_percentage
  end

  def coupon_valid_till(coupon_user)
    coupon_user.coupon.valid_till
  end
end
