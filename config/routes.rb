Rails.application.routes.draw do



  # Routes for the List item resource:

  # CREATE
  post("/insert_list_item", { :controller => "list_items", :action => "create" })
          
  # READ
  #get("/list_items", { :controller => "list_items", :action => "index" })
  
  #get("/list_items/:path_id", { :controller => "list_items", :action => "show" })
  
  # UPDATE
  
  post("/modify_list_item/:path_id", { :controller => "list_items", :action => "update" })
  
  # DELETE
  get("/delete_list_item/:path_id", { :controller => "list_items", :action => "destroy" })

  #------------------------------

  # Routes for the Food category resource:

  # CREATE
  post("/insert_food_category", { :controller => "food_categories", :action => "create" })
          
  # READ
  get("/food_categories", { :controller => "food_categories", :action => "index" })
  
  get("/food_categories/:path_id", { :controller => "food_categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_food_category/:path_id", { :controller => "food_categories", :action => "update" })
  
  # DELETE
  get("/delete_food_category/:path_id", { :controller => "food_categories", :action => "destroy" })

  #------------------------------

  # Routes for the List collaboration resource:

  # CREATE
  post("/insert_list_collaboration", { :controller => "list_collaborations", :action => "create" })
          
  # READ
  #get("/list_collaborations", { :controller => "list_collaborations", :action => "index" })
  
  #get("/list_collaborations/:path_id", { :controller => "list_collaborations", :action => "show" })
  
  # UPDATE
  
  post("/modify_list_collaboration/:path_id", { :controller => "list_collaborations", :action => "update" })
  
  # DELETE
  get("/delete_list_collaboration/:path_id", { :controller => "list_collaborations", :action => "destroy" })

  #------------------------------

  # Routes for the Shopping list resource:

  # CREATE
  post("/insert_shopping_list", { :controller => "shopping_lists", :action => "create" })
          
  # READ
  get("/", { :controller => "shopping_lists", :action => "index" })
  get("/shopping_lists", { :controller => "shopping_lists", :action => "index" })
  
  get("/shopping_lists/:path_id", { :controller => "shopping_lists", :action => "show" })
  
  # UPDATE
  
  post("/modify_shopping_list/:path_id", { :controller => "shopping_lists", :action => "update" })
  
  # DELETE
  get("/delete_shopping_list/:path_id", { :controller => "shopping_lists", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
