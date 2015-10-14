class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
    #@post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create

    #p = Post.new title: params[:title], content: params[:content]
    #p = Post.new params[:post].to_hash
    p = Post.new post_params


    if p.save
      redirect_to post_path(p)
    else
      render :new
    end
  end

  def edit
    #@post = Post.find params[:id]
  end

  def update
    #@post = Post.find params[:id]
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find params[:id]
  end
end
