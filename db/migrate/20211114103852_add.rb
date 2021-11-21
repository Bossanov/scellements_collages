class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :actualites, :lien, :string
  end
end
