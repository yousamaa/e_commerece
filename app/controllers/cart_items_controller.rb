# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    @cart_item = CartItem.new(cart_item_params)
    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to cart_path(params[:cart_id]), notice: 'Product was successfully added to cart.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(session[:cart_id]), notice: 'Product was successfully removed from cart.' }
      format.json { head :no_content }
    end
  end

  private

  def cart_item_params
    params.permit(:cart_id, :product_id)
  end
end
