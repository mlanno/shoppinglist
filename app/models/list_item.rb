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
end
