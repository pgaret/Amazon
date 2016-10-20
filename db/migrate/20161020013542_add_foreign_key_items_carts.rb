class AddForeignKeyItemsCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :cart_id, :integer
    add_foreign_key :items, :carts
  end
end
