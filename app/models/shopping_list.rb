# == Schema Information
#
# Table name: shopping_lists
#
#  id                        :integer          not null, primary key
#  list_collaborations_count :integer          default(0)
#  list_items_count          :integer          default(0)
#  list_name                 :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  user_id                   :integer
#
class ShoppingList < ApplicationRecord
end
