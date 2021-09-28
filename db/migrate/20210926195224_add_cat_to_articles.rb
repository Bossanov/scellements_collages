class AddCatToArticles < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :category, :theme
  end
end
