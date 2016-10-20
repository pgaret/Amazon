class RemoveCartidFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :cart_id
  end
end
