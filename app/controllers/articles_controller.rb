class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :show, :update]
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
    end

    def update
        article_params = params.require(:article).permit(:title, :season, :description, :image_url, :origin, :picture)
        @article.update(article_params)
        redirect_to root_path
    end

    def show
        @articlee = Article.all
        @articlee = @articlee[0..3]

        @comment = Comment.new
        @commente = @article.comments.order(created_at: :desc)
        @comments = @commente[0..2]

        if @article.comments.blank?
            @average_comment = 0
        else
            @average_comment = @article.comments.average(:rating).round(2)
        end


        # respond_to do |format|
        #     format.js { render inline: "location.reload();" }
        # end
    
    end

    def destroy
        @articl = Article.find(params[:id])
        @articl.destroy
        redirect_to root_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end
end
