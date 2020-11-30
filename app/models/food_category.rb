# == Schema Information
#
# Table name: food_categories
#
#  id               :integer          not null, primary key
#  aisle            :string
#  category         :string
#  list_items_count :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class FoodCategory < ApplicationRecord
end
