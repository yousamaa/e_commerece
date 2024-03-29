# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_product
  before_action :set_comment, except: %i[create]

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user

    if @product.save
      flash[:notice] = 'Comment created successfully!'
    else
      flash[:alert] = 'Comment not created!'
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comment has been updated'
    else
      flash[:alert] = 'Comment was not updated!'
    end
    redirect_to product_path(@product)
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:product_id, :content)
  end

  def set_product
    @product = Product.find_by(id: params[:product_id])
  end

  def set_comment
    @comment = @product.comments.find_by(id: params[:id])
  end
end
