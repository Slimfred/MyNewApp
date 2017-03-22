class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user
    # byebug
    respond_to do |format|
      if @comment.save
        format.html {redirect_to @product, notice: 'Comment was created successfully'}
        format.json {render :show, status: :created, location: @product}
      else
        format.html {redirect_to @product, alert: 'Comment & Rating required! Comment was not saved sucessfully'}
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    product = @comment.product
    @comment.destroy
    redirect_to product
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :body, :rating)
    end

end
