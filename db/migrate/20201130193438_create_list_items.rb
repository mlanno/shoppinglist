class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.string :item_name
      t.integer :quantity
      t.integer :list_id
      t.integer :category_id
      t.text :notes
      t.boolean :complete_flag, { :default => false }

      t.timestamps
    end
  end
end
