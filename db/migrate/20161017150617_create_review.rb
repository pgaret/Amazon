class CreateReview < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :score
      t.integer :user_id
      t.integer :item_id
    end
  end
end
