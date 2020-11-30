# == Schema Information
#
# Table name: list_items
#
#  id            :integer          not null, primary key
#  complete_flag :boolean          default(FALSE)
#  item_name     :string
#  notes         :text
#  quantity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :integer
#  list_id       :integer
#
class ListItem < ApplicationRecord

  belongs_to(:list, { :required => false, :class_name => "ShoppingList", :foreign_key => "list_id", :counter_cache => true })

  belongs_to(:category, { :required => false, :class_name => "FoodCategory", :foreign_key => "category_id", :counter_cache => true })
  
end
