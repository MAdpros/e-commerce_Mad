class ArticlesController < ApplicationController


    def index
        
    end

    def new
        @article = Article.new
        # @articl = @article.find(params[:id])
    end

    def create
        article_params = params.require(:article).permit(:title, :season, :description, :image_url, :origin)
       @article = Article.create(article_params)
       redirect_to root_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        article_params = params.require(:article).permit(:title, :season, :description, :image_url, :origin)
        @article.update(article_params)
        redirect_to root_path
    end

    def show
        @articl = Article.find(params[:id])
        @article = Article.all
        @article = @article[0..3]
        
    end

    def destroy
        @articl = Article.find(params[:id])
        @articl.destroy
        redirect_to root_path
    end
end
