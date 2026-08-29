class Article < ApplicationRecord
    has_many :tags
    has_many :hashtags, through: :tags
    has_rich_text :content
    has_many_attached :images
end
