class AddUserNicknameToBuy < ActiveRecord::Migration[5.2]
  def change
    add_column :buys, :user_nickname, :string
  end
end
