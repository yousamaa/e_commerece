# frozen_string_literal: true

module CartsHelper
  def total_bill(cart)
    sum = 0
    cart.cart_items.each do |cart_item|
      sum += cart_item.product.price * cart_item.quantity
    end
    sum
  end
end
