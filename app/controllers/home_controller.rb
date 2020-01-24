class HomeController < ApplicationController
  def index
    @article = Article.all
    # @articl = @article.find(params[:id])
    # @articl = Article.all.where(image_url:"gingembre.png")
  end
end
