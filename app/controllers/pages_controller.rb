class PagesController < ApplicationController
    allow_unauthenticated_access
    before_action :set_articles, only: %i[home articles about]
    
    def home
    end

    def articles
    end

    def about
    end

    private

    def set_articles
        @articles = Article.all.order(created_at: :desc)
    end

end