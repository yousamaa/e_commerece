# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show destroy]
  before_action :authenticate_user!, except: [:show]

  def show
    @cart_items = CartItem.where(cart_id: session[:cart_id])
  end

  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end
end
