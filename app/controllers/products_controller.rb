class ProductsController < ApplicationController
   before_action :authenticate_manager!, only: [:create, :update, :destroy]
   before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @product = Product.all
    @article = Article.where(params[:@product])
  end

  def show
    
    @a = @product.type_id
    @typ = Type.find(@a)

    @art = @product.article_id
    @arti = Article.find(@art)

    #  respond_to do |format|
    #   format.js
    # end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
     @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
     @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Transit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:article_id, :type_id, :price)
    end
end
