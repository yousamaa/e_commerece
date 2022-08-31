class CommentsController < ApplicationController
  def index
    @comments = Comment.where(product_id: params[:id])
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit() end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @product
    else
      flash.now[:danger] = 'error'
    end
  end

  def update
  end

  def destroy
  end
  
  private

  def comment_params
    params.require(:comment).permit(:product_id, :content)
  end
end
