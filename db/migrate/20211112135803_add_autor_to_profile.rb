class AddAutorToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :autor, :text
  end
end
