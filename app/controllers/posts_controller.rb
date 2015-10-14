class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create

    #p = Post.new title: params[:title], content: params[:content]
    #p = Post.new params[:post].to_hash
    p = Post.new params.require(:post).permit(:title, :content)


    if p.save
      redirect_to post_path(p)
    else
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update params.require(:post).permit(:title, :content)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

end
