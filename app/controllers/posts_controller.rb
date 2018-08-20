class PostsController < ApplicationController
  
  before_action :move_to_index, except: [:index,:show]
  before_action :set_post, only: [:destroy, :edit, :update, :show]
  
    def index
      @posts = Post.order("created_at DESC").includes(:user).page(params[:page]).per(5)
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

    def destroy
      if @post.user_id == current_user.id
        @post.destroy
        redirect_to :back 
      end
    end

    def edit
    end

    def update
      @post.update(post_params) if @post.user_id == current_user.id
      redirect_to root_path
    end

    def show
    end


    private
    def post_params
      params.require(:post).permit(:text).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

    def set_post
      @post = Post.find(params[:id])
    end


end
