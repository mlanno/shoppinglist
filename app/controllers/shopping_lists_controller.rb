class ShoppingListsController < ApplicationController
  def index
    #matching_shopping_lists = ShoppingList.where( { :user.id => @current_user.id })
    matching_shopping_lists = @current_user.shopping_lists

    @list_of_shopping_lists = matching_shopping_lists.order({ :created_at => :desc })

    matching_list_collaborations = @current_user.list_collaborations

    @list_of_list_collaborations = matching_list_collaborations.order({ :created_at => :desc })

    render({ :template => "shopping_lists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_shopping_lists = ShoppingList.where({ :id => the_id })

    @the_shopping_list = matching_shopping_lists.at(0)

    matching_list_items = ListItem.where({ :list_id => the_id })

    list_items_incomplete = matching_list_items.where({ :complete_flag => false })

    @list_of_list_items_incomplete = list_items_incomplete.order({ :category_id => :asc })

    list_items_complete = matching_list_items.where({ :complete_flag => true })

    @list_of_list_items_complete = list_items_complete.order({ :category_id => :asc })

    matching_list_collaborations = ListCollaboration.where({ :list_id => the_id })

    @the_list_collaboration = matching_list_collaborations.order({ :created_at => :desc })

    users = User.all

    @user_list = users.order({ :name => :desc })

    matching_food_categories = FoodCategory.all

    @list_of_food_categories = matching_food_categories.order({ :category => :asc })

    render({ :template => "shopping_lists/show.html.erb" })

  end

  def create
    the_shopping_list = ShoppingList.new
    the_shopping_list.list_name = params.fetch("query_list_name")
    the_shopping_list.user_id = @current_user.id
    
    if the_shopping_list.valid?
      the_shopping_list.save
      redirect_to("/shopping_lists", { :notice => "Shopping list created successfully." })
    else
      redirect_to("/shopping_lists", { :notice => "Shopping list failed to create successfully." })
    end
  end

  def edit_form
   the_id = params.fetch("path_id")

  matching_shopping_lists = ShoppingList.where({ :id => the_id })

  @the_shopping_list = matching_shopping_lists.at(0)
  
  render({ :template => "shopping_lists/edit_form.html.erb" })
  end
  
  def update
    the_id = params.fetch("path_id")
    the_shopping_list = ShoppingList.where({ :id => the_id }).at(0)

    the_shopping_list.list_name = params.fetch("query_list_name")
    the_shopping_list.user_id = params.fetch("query_user_id")
    the_shopping_list.list_items_count = params.fetch("query_list_items_count")
    the_shopping_list.list_collaborations_count = params.fetch("query_list_collaborations_count")

    if the_shopping_list.valid?
      the_shopping_list.save
      redirect_to("/shopping_lists/#{the_shopping_list.id}", { :notice => "Shopping list updated successfully."} )
    else
      redirect_to("/shopping_lists/#{the_shopping_list.id}", { :alert => "Shopping list failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_shopping_list = ShoppingList.where({ :id => the_id }).at(0)

    the_shopping_list.destroy

    redirect_to("/shopping_lists", { :notice => "Shopping list deleted successfully."} )
  end
end
