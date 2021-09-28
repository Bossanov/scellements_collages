class AddNameToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :last_name, :text
    add_column :profiles, :first_name, :text

  end
end
