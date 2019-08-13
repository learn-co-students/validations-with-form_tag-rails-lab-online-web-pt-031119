class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    if params[:id]
    @post = Post.find(params[:id])
    else
    @post = Post.new(post_params) 
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post)
    else
    render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
