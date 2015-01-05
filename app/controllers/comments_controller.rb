class CommentsController < ApplicationController
	def index
  end

  def new
    @comment = Comment.new
  end

  def create
    p params[:comment][:text]
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:notice] = "Thanks for your comment!"
    else
      flash[:alert] = "Your comment could not be posted. Please try again."
    end

    redirect_to "/posts/#{params[:post_id]}"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    
    if @comment.destroy
      flash[:notice] = "Comment deleted."
    else
      flash[:alert] = "Could not delete comment. please try again."
    end

    redirect_to "/posts/#{params[:post_id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
