# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    @session = Stripe::Checkout::Session.create({
                                                  # success_url: root_url,
                                                  # cancel_url: manage_posts_url,
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    price_data: {
                                                      currency: 'usd',
                                                      product_data: {
                                                        name: 'T-shirt'
                                                      },
                                                      unit_amount: 2000
                                                    },
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  metadata: { product_id: params[:product_id] },
                                                  customer_email: current_user.email,
                                                  success_url: root_url,
                                                  cancel_url: products_url
                                                })

    respond_to do |format|
      format.js
    end
  end
end
