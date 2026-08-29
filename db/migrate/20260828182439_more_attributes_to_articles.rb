class MoreAttributesToArticles < ActiveRecord::Migration[8.1]
  def change
    add_column :articles, :title, :string
    add_column :articles, :subtitle, :string
    add_column :articles, :tldr, :text
    add_column :articles, :share_count, :integer
  end
end
