class OfferOneMonthspremiumtoUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :premium_until, :date
  end
end
