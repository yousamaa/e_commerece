class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_images
  end

  def create
    product = current_user.products.create! params.require(:product).permit(:name, :price, images: [])
    redirect_to product
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
end
