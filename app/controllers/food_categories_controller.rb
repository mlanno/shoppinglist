class FoodCategoriesController < ApplicationController
  def index
    matching_food_categories = FoodCategory.all

    @list_of_food_categories = matching_food_categories.order({ :created_at => :desc })

    render({ :template => "food_categories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_food_categories = FoodCategory.where({ :id => the_id })

    @the_food_category = matching_food_categories.at(0)

    render({ :template => "food_categories/show.html.erb" })
  end

  def create
    the_food_category = FoodCategory.new
    the_food_category.category = params.fetch("query_category")
    the_food_category.aisle = params.fetch("query_aisle")
    the_food_category.list_items_count = params.fetch("query_list_items_count")

    if the_food_category.valid?
      the_food_category.save
      redirect_to("/food_categories", { :notice => "Food category created successfully." })
    else
      redirect_to("/food_categories", { :notice => "Food category failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_food_category = FoodCategory.where({ :id => the_id }).at(0)

    the_food_category.category = params.fetch("query_category")
    the_food_category.aisle = params.fetch("query_aisle")
    the_food_category.list_items_count = params.fetch("query_list_items_count")

    if the_food_category.valid?
      the_food_category.save
      redirect_to("/food_categories/#{the_food_category.id}", { :notice => "Food category updated successfully."} )
    else
      redirect_to("/food_categories/#{the_food_category.id}", { :alert => "Food category failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_food_category = FoodCategory.where({ :id => the_id }).at(0)

    the_food_category.destroy

    redirect_to("/food_categories", { :notice => "Food category deleted successfully."} )
  end
end
