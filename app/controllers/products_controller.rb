class ProductsController < ApplicationController

  def index
    @product = Product.all
    
  end

  def show
    @prod = Product.find(params[:id])
    @a = @prod.type_id
    @typ = Type.find(@a)

    @art = @prod.article_id
    @arti = Article.find(@art)

     respond_to do |format|
      format.js
    end
  end

  def create
    
  end
end
