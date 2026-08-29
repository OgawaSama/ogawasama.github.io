class HashtagsController < ApplicationController
    allow_unauthenticated_access only: %i[show index]
    before_action :set_hashtag, only: %i[show]
    before_action :set_hashtags, only: %i[index]
    
    def show
    end

    def new
        @new_hashtag = Hashtag.build
    end

    def index
    end

    def create
        @new_hashtag = Hashtag.new(hashtag_params)

        respond_to do |format|
            if @new_hashtag.save
                format.html { redirect_to @new_hashtag, notice: "Hashtag was successfully created.", status: :see_other }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private

    def set_hashtag
        @hashtag = Hashtag.find(params[:id])
    end

    def set_hashtags
        @hashtags = Hashtag.all
    end

    def hashtag_params
        params.require(:hashtag).permit(:name)
    end
end