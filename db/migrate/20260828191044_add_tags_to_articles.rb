class AddTagsToArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :hashtags do |t|
      t.string    :name, null: false
      t.timestamps
    end

    create_table :tags, primary_key: [:article_id, :hashtag_id] do |t|
      t.belongs_to :article
      t.belongs_to :hashtag
    end
  end
end
