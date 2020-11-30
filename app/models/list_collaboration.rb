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
end
