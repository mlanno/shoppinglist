class CreateShoppingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_lists do |t|
      t.string :list_name
      t.integer :user_id
      t.integer :list_items_count, { :default => 0 }
      t.integer :list_collaborations_count, { :default => 0 }

      t.timestamps
    end
  end
end
