class AddPurchasedToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :purchased, :string
  end
end
