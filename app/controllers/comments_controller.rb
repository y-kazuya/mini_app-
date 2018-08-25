class CommentsController < ApplicationController
    before_action :set_post
    
    def create
      @comment = @post.comments.new(comment_params) 
      @comment.save if user_signed_in? 
      redirect_to post_path(@post)
    end

    def update
      @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        respond_to do |format|
          format.html { redirect_to root_path }
          format.json
        end
      end
    end
    private
    def comment_params
      params.require(:comment).permit(:text, :score).merge(user_id: current_user.id)
    end

    def set_post
      @post = Post.find(params[:post_id])  
    end
end
