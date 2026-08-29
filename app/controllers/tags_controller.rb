class TagsController < ApplicationController

    def new
        @tag = Tag.build
    end

    def create
        @tag = Tag.new(tag_params)

        respond_to do |format|
            if @tag.save
                format.html { redirect_to hashtag_index_path, notice: "Tag was successfully connected.", status: :see_other }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    private

    def tag_params
        params.require(:tag).permit(:article_id, :hashtag_id)
    end
end