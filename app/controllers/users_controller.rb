class UsersController < ApplicationController
  
  def show
    @sort_type = params[:sort_type]
    @sort = "U_S"
    @user = User.find(params[:id])
    @count = @user.posts.count
    case @sort_type
      when "score"
        @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
      when "comments"
        @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
      else
        @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    end
  end

end
