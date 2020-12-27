class CreateBuys < ActiveRecord::Migration[5.2]
  def change
    create_table :buys do |t|

      t.string   :bought
      t.integer  :user_id
      t.timestamps
    end
  end
end
