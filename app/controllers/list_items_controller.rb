class ListItemsController < ApplicationController
  def index
    matching_list_items = ListItem.all

    @list_of_list_items = matching_list_items.order({ :created_at => :desc })

    render({ :template => "list_items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_list_items = ListItem.where({ :id => the_id })

    @the_list_item = matching_list_items.at(0)

    matching_food_categories = FoodCategory.all

    @list_of_food_categories = matching_food_categories.order({ :category => :asc })

    render({ :template => "list_items/show.html.erb" })
  end

  def create
    the_list_item = ListItem.new
    the_list_item.item_name = params.fetch("query_item_name")
    the_list_item.quantity = params.fetch("query_quantity")
    the_list_item.unit = params.fetch("query_unit")
    the_list_item.list_id = params.fetch("query_list_id")
    the_list_item.category_id = params.fetch("query_category_id")
    the_list_item.notes = params.fetch("query_notes")
    the_list_item.complete_flag = params.fetch("query_complete_flag", false)
    
    if the_list_item.valid?
      the_list_item.save
      redirect_to("/shopping_lists/#{the_list_item.list_id}", { :notice => "List item created successfully." })
    else
      redirect_to("/shopping_lists/#{the_list_item.list_id}", { :notice => "List item failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_list_item = ListItem.where({ :id => the_id }).at(0)

    the_list_item.item_name = params.fetch("query_item_name")
    the_list_item.quantity = params.fetch("query_quantity")
    the_list_item.unit = params.fetch("query_unit")
    the_list_item.list_id = params.fetch("query_list_id")
    the_list_item.category_id = params.fetch("query_category_id")
    the_list_item.notes = params.fetch("query_notes")
    the_list_item.complete_flag = params.fetch("query_complete_flag", false)

    if the_list_item.valid?
      the_list_item.save
      redirect_to("/shopping_lists/#{the_list_item.list_id}", { :notice => "List item updated successfully."} )
    else
      redirect_to("/list_items/#{the_list_item.id}", { :alert => "List item failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_list_item = ListItem.where({ :id => the_id }).at(0)

    the_list_item.destroy

    redirect_to("/shopping_lists/#{the_list_item.list_id}", { :notice => "List item deleted successfully."} )
  end
end
