class ArticlesController < ApplicationController
    before_action :authenticate_manager!, only: [:create, :edit, :update, :destroy]

    def index
        @article = Article.all
    end

    def new
        @article = Article.new
        # @articl = @article.find(params[:id])
    end

    def create
        article_params = params.require(:article).permit(:title, :season, :description, :image_url, :origin, :picture)
       @article = Article.create(article_params)
       redirect_to root_path
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        article_params = params.require(:article).permit(:title, :season, :description, :image_url, :origin, :picture)
        @article.update(article_params)
        redirect_to root_path
    end

    def show
        @article = Article.find(params[:id])
        @articlee = Article.all
        @articlee = @articlee[0..3]
        
    end

    def destroy
        @articl = Article.find(params[:id])
        @articl.destroy
        redirect_to root_path
    end
end
