class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :nom
      t.string :email
      t.string :prof
      t.timestamps
    end
  end
end
