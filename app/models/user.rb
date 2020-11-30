# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string
#  name                 :string
#  password_digest      :string
#  shopping_lists_count :integer          default(0)
#  username             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:shopping_lists, { :class_name => "ShoppingList", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:list_collaborations, { :class_name => "ListCollaboration", :foreign_key => "collab_with_user_id", :dependent => :destroy })

  validates(:username, { :presence => true })

  validates(:username, { :uniqueness => true })

  validates(:name, { :presence => true })
end
