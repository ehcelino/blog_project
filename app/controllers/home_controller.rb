class HomeController < ApplicationController
  skip_before_action :check_timeout
  def index
    page = params[:page] || 1
    @per_page = 2
    offset = (page.to_i - 1) * @per_page
    @posts = Post.offset(offset).limit(@per_page).order(created_at: :desc)
    puts "teste"
    logger.debug "test"
    # @posts = Post.all.order(created_at: :desc)
  end

end
