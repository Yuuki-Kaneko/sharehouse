class ChangeDateNumberToTops < ActiveRecord::Migration[5.2]
  def change
      
      change_column :tops, :number, :string
      
  end
end
