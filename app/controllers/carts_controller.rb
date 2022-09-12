# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :set_cart_user, only: [:show]

  def show; end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_cart
    @cart = @current_cart
  end

  def set_cart_user
    @current_cart.user = current_user unless current_user.nil?
    @current_cart.save
  end
end
