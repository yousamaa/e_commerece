# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart
  before_action :set_search
  rescue_from Pundit::NotAuthorizedError, with: :resource_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[avatar name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar name])
  end

  private

  def resource_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id])
    return @current_cart unless @current_cart.nil?

    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end

  def set_search
    @search = Product.search(params[:q])
  end
end
