class HomeController < ApplicationController
  include CurrentCart

  def index
    @articles = Article.all 
  end

  def show
    @articl = Article.find(params[:id])
    
    @product = @articl.Products.ids
    @produit = Product.find(@product)


    # @produit.each do |produit|
    #   @article = produit.article_id
    #   @arti = Article.find(@article)
      
    #   @type = produit.type_id
    #   @typ = Type.find(@type)
    # end
 
    respond_to do |format|
      format.js
    end
  end
end
