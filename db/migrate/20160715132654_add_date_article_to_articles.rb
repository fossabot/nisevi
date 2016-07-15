class AddDateArticleToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :date_article, :date
  end
end
