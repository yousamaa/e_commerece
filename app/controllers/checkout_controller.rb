# frozen_string_literal: true

class CheckoutController < ApplicationController
  before_action :set_bill, only: %i[create]
  include CartsHelper

  def create

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'usd',
          product_data: {
            name: 'Total'
          },
          unit_amount: (@total_bill * 100)
        },
        quantity: 1
      }],
      mode: 'payment',
      metadata: { cart_id: params[:cart_id] },
      customer_email: current_user.email,
      success_url: root_url << 'checkout_success',
      cancel_url: cart_url(@current_cart)
    })
    respond_to do |format|
      format.js
    end
  end

  def checkout_success
    @current_cart.cart_items.destroy_all
    flash[:notice] = 'Checkout Successful.'
    redirect_to root_path
  end

  private

  def set_bill
    cart = Cart.find_by(id: params[:cart_id])
    @total_bill = total_bill(cart).to_i
  end
end 