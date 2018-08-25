class CommentsController < ApplicationController
    before_action :set_post
    
    def create
      @comment = @post.comments.new(comment_params) 
      @comment.save if user_signed_in? && @comment.score <= 100 && @comment.score >= 0
      redirect_to post_path(@post)
    end

    def update
      @comment = Comment.find(params[:id])
      @comment.update(comment_params) if @comment.user_id == current_user.id
      redirect_to post_path(@post)
    end
    private
    def comment_params
      params.require(:comment).permit(:text, :score).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find(params[:post_id])  
    end
end
