class CreatePublicities < ActiveRecord::Migration[6.1]
  def change
    create_table :publicities do |t|
      t.string :title
      t.text :content
      t.string :lien
      t.string :situation
      t.string :taille
      t.string :statut

      t.timestamps
    end
  end
end
