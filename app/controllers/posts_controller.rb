class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title],
                     body: params[:post][:body])

      if @post.save
        return redirect_to post_path(@post.id)
      end
    render :new
  end

end
