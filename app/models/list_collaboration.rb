# == Schema Information
#
# Table name: list_collaborations
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  collab_with_user_id :integer
#  list_id             :integer
#
class ListCollaboration < ApplicationRecord

  belongs_to(:collab_with_user, { :required => false, :class_name => "User", :foreign_key => "collab_with_user_id" })

  belongs_to(:list, { :required => false, :class_name => "ShoppingList", :foreign_key => "list_id", :counter_cache => true })

  
end
