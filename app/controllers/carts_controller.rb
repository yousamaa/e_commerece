# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show]
  before_action :set_cart_to_delete, only: %i[destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :set_cart_user, only: [:show]

  def show; end

  def destroy
    if @cart.destroy
      flash[:notice] = 'Cart deleted successfully!'
    else
      flash[:alert] = 'Cart not deleted!.'
    end

    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_cart_to_delete
    @cart = Cart.find(params[:id])
  end

  def set_cart
    @cart = @current_cart
  end

  def set_cart_user
    @current_cart.user = current_user unless current_user.nil?
    @current_cart.save
  end
end
