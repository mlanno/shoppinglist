class AddUnittoListItem < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :unit, :string
  end
end
