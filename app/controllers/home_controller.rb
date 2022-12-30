class HomeController < ApplicationController

  def index
    page = params[:page] || 1
    @per_page = 2
    offset = (page.to_i - 1) * @per_page
    @posts = Post.offset(offset).limit(@per_page).order(created_at: :desc)
    
    # @posts = Post.all.order(created_at: :desc)
  end

end
