class PostsController < ApplicationController
  
  before_action :move_to_index, except: [:index,:show]
  before_action :set_post, only: [:destroy, :edit, :update, :show]
  before_action :set_sort_type, only:[:index, :show,]
  
    def index
      @sort = "P_I"
      case @sort_type
        when "score"
          @posts = Post.order("created_at DESC").includes(:user).page(params[:page]).per(5)
        when "comments"
          @posts = Post.order("created_at DESC").includes(:user).page(params[:page]).per(5)
        else
          @posts = Post.order("created_at DESC").includes(:user).page(params[:page]).per(5)
      end
      
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.text.present?
        if @post.save
          redirect_to root_path
        else
          redirect_to :back 
        end
      else
        redirect_to :back 
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
      @post.update(post_params) if @post.user_id == current_user.id && @post.text.present?
      redirect_to root_path
    end

    def show
      @sort = "P_S"
      @comment = Comment.new
      @count = @post.comments.count
      @average = @post.comments.average(:score)
      case @sort_type
        when "score"
          @comments = @post.comments.order("score DESC").includes(:user).page(params[:page]).per(5)
        when "comments"
          @comments = @post.comments.order("created_at DESC").includes(:user).page(params[:page]).per(5)
        else
          @comments = @post.comments.order("created_at DESC").includes(:user).page(params[:page]).per(5)
      end
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
  
    def set_sort_type
      @sort_type = params[:sort_type]
    end

end
