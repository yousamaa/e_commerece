# frozen_string_literal: true

module CartsHelper
  def total_bill(cart)
    coupon = Coupon.find_by(user_id: cart.user_id)
    sum = 0
    cart.cart_items.each do |cart_item|
      sum += cart_item.product.price * cart_item.quantity
    end
    return sum - (sum * discount(coupon)) unless coupon.nil? || coupon_valid_till(coupon) < DateTime.now

    sum
  end

  def discount(coupon)
    coupon.discount_percentage
  end

  def coupon_valid_till(coupon)
    coupon.valid_till
  end
end
