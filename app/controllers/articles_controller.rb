class ArticlesController < ApplicationController
    allow_unauthenticated_access only: %i[show index]
    before_action :set_article, only: %i[show edit update]
    before_action :set_articles, only: %i[index]

    
    def show
    end

    def edit
    end

    def new
        @article = Article.build
    end

    def index
    end

    def create
        @article = Article.new(article_params)

        respond_to do |format|
            if @article.save
                format.html { redirect_to @article, notice: "Article was successfully created.", status: :see_other }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
    
    def update
        respond_to do |format|
            if @article.update(article_params)
                format.html { redirect_to @article, notice: "Article was successfully updated.", status: :see_other }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def set_articles
        @articles = Article.all
    end

    def article_params
        params.require(:article).permit(:title, :subtitle, :tldr, :content, :images, :tags)
    end
end