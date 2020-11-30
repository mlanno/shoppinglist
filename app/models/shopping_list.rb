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
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  
  has_many(:list_items, { :class_name => "ListItem", :foreign_key => "list_id", :dependent => :destroy })

  has_many(:list_collaborations, { :class_name => "ListCollaboration", :foreign_key => "list_id", :dependent => :destroy })

  validates(:user_id, { :presence => true })

  validates(:list_name, { :presence => true })
end
