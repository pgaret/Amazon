class AddForeignKeysCartsUsers < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :carts, :users
    add_foreign_key :users, :carts
  end
end
