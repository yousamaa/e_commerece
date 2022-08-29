class ProductsController < ApplicationController
  def index
    @products = Product.all.with_attached_images
  end

  def create
    product = current_user.products.create(product_params)
    redirect_to product
  end

  def show
    @product = Product.find(params[:id])
    @comments = Comment.where(product_id: params[:id])
    @comment  = @product.comments.build
  end

  def new
    @product = Product.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, images: [])
  end
end
