class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|

      t.string   :grocery
      t.integer  :number
      t.integer  :user_id

      t.timestamps
    end
  end
end
