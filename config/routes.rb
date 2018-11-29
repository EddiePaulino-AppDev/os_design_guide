Rails.application.routes.draw do
  # Routes for the Tab resource:

  # CREATE
  get("/tabs/new", { :controller => "tabs", :action => "new_form" })
  post("/create_tab", { :controller => "tabs", :action => "create_row" })

  # READ
  get("/tabs", { :controller => "tabs", :action => "index" })
  get("/tabs/:id_to_display", { :controller => "tabs", :action => "show" })

  # UPDATE
  get("/tabs/:prefill_with_id/edit", { :controller => "tabs", :action => "edit_form" })
  post("/update_tab/:id_to_modify", { :controller => "tabs", :action => "update_row" })

  # DELETE
  get("/delete_tab/:id_to_remove", { :controller => "tabs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Topic resource:

  # CREATE
  get("/topics/new", { :controller => "topics", :action => "new_form" })
  post("/create_topic", { :controller => "topics", :action => "create_row" })

  # READ
  get("/topics", { :controller => "topics", :action => "index" })
  get("/topics/:id_to_display", { :controller => "topics", :action => "show" })

  # UPDATE
  get("/topics/:prefill_with_id/edit", { :controller => "topics", :action => "edit_form" })
  post("/update_topic/:id_to_modify", { :controller => "topics", :action => "update_row" })

  # DELETE
  get("/delete_topic/:id_to_remove", { :controller => "topics", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
