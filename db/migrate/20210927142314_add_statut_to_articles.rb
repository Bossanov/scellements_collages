class AddStatutToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :statut, :string

  end
end
