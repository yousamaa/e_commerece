# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  # before_action :authenticate_user!, except: [:index]

  def index
    @search = Product.search(params[:q])
    @products = @search.result
  end

  def show
    @comments = @product.comments.includes(:user).all
    @comment  = @product.comments.build
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to @product
      flash[:notice] = 'Product was successfully created.'
    else
      flash[:alert] = 'Product was not created.'
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product
      flash[:notice] = 'Product was successfully updated.'
    else
      flash[:alert] = 'Product was not updated.'
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_url
      flash[:notice] = 'Product was successfully deleted.'
    else
      flash[:alert] = 'Product was not deleted.'
    end
  end

  def search
    index
    render :index
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, images: [])
  end
end
