# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_product

  def create
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @product, alert: 'Comment must have content.' }
      end
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to product_url(@product), notice: 'Comment has been updated' }
      else
        format.html { redirect_to product_url(@product), alert: 'Comment was not updated!' }
      end
    end
  end

  def destroy
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:product_id, :content)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
