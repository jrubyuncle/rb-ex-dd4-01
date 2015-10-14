class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
  end

  def create

    p = Post.new title: params[:title], content: params[:content]

    if p.save
      redirect_to post_path(p)
    else
      render :new
    end
  end
end
