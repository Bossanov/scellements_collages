class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :statut
      t.string :address
      t.integer :post_code
      t.string :city
      t.string :country

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
