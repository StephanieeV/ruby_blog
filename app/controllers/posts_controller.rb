class PostsController < ApplicationController
  def index
      @posts=Post.all
  end

  def show
      @post=Post.find(params[:id])
  end

  def new
      @post = Post.new
  end

  def edit
      @post = Post.find(params[:id])
  end

  def create
      post_param = params.require(:post).permit(:title, :date, :introduction, :body, :picture, :user_id)

      @post = Post.new(post_param)
      if @post.save
          flash[:success] = "Post was successfully created"
          redirect_to @post
      else
          flash[:error] = "Something went wrong"
          render 'new'
      end
  end

  def update
      @post = Post.find(params[:id])
      @post.update(title: params[:post][:title],date: params[:post][:date], introduction: params[:post][:introduction],body: params[:post][:body],picture: params[:post][:picture], user_id: params[:post][:user_id] )
      redirect_to @post
  end

  def destroy
   
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to action: 'index'
  end
end
