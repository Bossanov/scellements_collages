class CreateActualites < ActiveRecord::Migration[6.1]
  def change
    create_table :actualites do |t|
      t.string :title
      t.string :date
      t.text :content
      t.string :statut

      t.timestamps
    end
  end
end
