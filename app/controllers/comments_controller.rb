class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:format])
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(title: params[:comment][:title],
                     body: params[:comment][:body],
                     user_id: params[:comment][:user_id],
                     post_id: params[:comment][:post_id])

      if @comment.save
        return redirect_to post_path(params[:comment][:post_id])
      end
    render :new
  end

end
