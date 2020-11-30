class ListCollaborationsController < ApplicationController
  def index
    matching_list_collaborations = @current_user.list_collaborations

    @list_of_list_collaborations = matching_list_collaborations.order({ :created_at => :desc })

    render({ :template => "list_collaborations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_list_collaborations = ListCollaboration.where({ :id => the_id })

    @the_list_collaboration = matching_list_collaborations.at(0)

    render({ :template => "list_collaborations/show.html.erb" })
  end

  def create
    the_list_collaboration = ListCollaboration.new
    the_list_collaboration.list_id = params.fetch("query_list_id")
    the_list_collaboration.collab_with_user_id = params.fetch("query_collab_with_user_id")

    if the_list_collaboration.valid?
      the_list_collaboration.save
      redirect_to("/list_collaborations", { :notice => "List collaboration created successfully." })
    else
      redirect_to("/list_collaborations", { :notice => "List collaboration failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_list_collaboration = ListCollaboration.where({ :id => the_id }).at(0)

    the_list_collaboration.list_id = params.fetch("query_list_id")
    the_list_collaboration.collab_with_user_id = params.fetch("query_collab_with_user_id")

    if the_list_collaboration.valid?
      the_list_collaboration.save
      redirect_to("/list_collaborations/#{the_list_collaboration.id}", { :notice => "List collaboration updated successfully."} )
    else
      redirect_to("/list_collaborations/#{the_list_collaboration.id}", { :alert => "List collaboration failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_list_collaboration = ListCollaboration.where({ :id => the_id }).at(0)

    the_list_collaboration.destroy

    redirect_to("/list_collaborations", { :notice => "List collaboration deleted successfully."} )
  end
end
