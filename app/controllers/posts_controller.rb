class PostsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :new]
  before_action :set_post, only: [:destroy]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title],
                     body: params[:post][:body],
                     user_id: params[:post][:user_id])

      if @post.save
        return redirect_to post_path(@post.id)
      end
    render :new
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post apagado com sucesso."
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
    # if @post.update(title: params[:post][:title],
    #   body: params[:post][:body],
    #   user_id: params[:post][:user_id])
      
      redirect_to post_path(@post.id), notice: "Post atualizado com sucesso."
    else
      render :edit
    end
  end

  private
  
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
