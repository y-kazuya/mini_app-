class PostsController < ApplicationController

    def index
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to root_path
      else
        render :new
      end
    end

    def edit
    end

    def update
    end

    def show
    end


    private
    def post_params
      params.require(:post).permit(:text).merge(user_id: 1)
    end

end
