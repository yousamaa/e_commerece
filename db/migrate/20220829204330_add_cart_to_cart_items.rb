# frozen_string_literal: true

class AddCartToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :cart, foreign_key: true, null: false
  end
end
