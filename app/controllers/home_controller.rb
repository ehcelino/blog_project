class HomeController < ApplicationController
  skip_before_action :check_timeout
  def index
    page = params[:page] || 1
    @per_page = 2
    offset = (page.to_i - 1) * @per_page
    @posts = Post.offset(offset).limit(@per_page).order(created_at: :desc)
    @comments = Comment.order(created_at: :desc).limit(2)
    # @posts = Post.all.order(created_at: :desc)
  end


  def search
    @results = Post.where('body LIKE ?', "%#{params[:q]}%")
  end

end
