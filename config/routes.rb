Rails.application.routes.draw do

  get("/", { :controller => "students", :action => "index" })


  # Index route for displaying all uploaded files
  get '/uploaded_files' => 'uploaded_files#index', as: :uploaded_files

  # New route for displaying the form to upload a new file
  get '/uploaded_files/new' => 'uploaded_files#new'

  # Create route for the form submission to upload a file
  post '/uploaded_files' => 'uploaded_files#create'

  get 'uploaded_files/:id', to: 'uploaded_files#details', as: 'uploaded_file_details'

  get 'delete_uploaded_file/:id' => 'uploaded_files#destroy'
  #------------------------------
  # Department routes

  get("/departments", { :controller => "departments", :action => "index" })
  
  get("/departments/:path_id", { :controller => "departments", :action => "show" })

  post("/insert_department", { :controller => "departments", :action => "create" })

  get("/departments", { :controller => "departments", :action => "index" })
  
  post("/modify_department/:path_id", { :controller => "departments", :action => "update" })

  get("/delete_department/:path_id", { :controller => "departments", :action => "destroy" })

  #------------------------------
  # Course routes

  get("/courses", { :controller => "courses", :action => "index" })
  
  get("/courses/:path_id", { :controller => "courses", :action => "show" })

  post("/insert_course", { :controller => "courses", :action => "create" })

  get("/courses", { :controller => "courses", :action => "index" })
  
  post("/modify_course/:path_id", { :controller => "courses", :action => "update" })

  get("/delete_course/:path_id", { :controller => "courses", :action => "destroy" })

  # User routes
  get("/students/sign_up", { :controller => "students", :action => "new_registration_form"})
  get("/students/sign_in", { :controller => "students", :action => "new_session_form"})
  get("/students/sign_out", { :controller => "students", :action => "toast_cookies"})
  post("/verify_credentials", { :controller => "students", :action => "authenticate"})

  # CREATE
  get("/insert_user_record", {:controller => "students", :action => "create" })

  # READ
  get("/students", {:controller => "students", :action => "index"})
  get("/students/:the_username", {:controller => "students", :action => "show"})

  # UPDATE
  post("/modify_student/:the_username", {:controller => "students", :action => "update" })

  # DELETE
  get("/delete_student/:the_username", {:controller => "students", :action => "destroy"})

  post("/insert_enrollment", { :controller => "enrollments", :action => "create" })

  # Comment routes

  # CREATE
  get("/insert_comment_record", { :controller => "comments", :action => "create" })

  # DELETE

  get("/delete_comment/:the_comment_id", { :controller => "comments", :action => "destroy"})

end
