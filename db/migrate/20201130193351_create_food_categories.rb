class CreateFoodCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :food_categories do |t|
      t.string :category
      t.string :aisle
      t.integer :list_items_count, { :default => 0 }

      t.timestamps
    end
  end
end
