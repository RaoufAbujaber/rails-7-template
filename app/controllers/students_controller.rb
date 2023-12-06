class StudentsController < ApplicationController
  def toast_cookies
    reset_session

    redirect_to("/", { :notice => "Goodbye" })
  end

  def new_registration_form
    render({ :template => "students/signup_form" })
  end

  def new_session_form
    render({ :template => "students/signin_form" })
  end

  def authenticate
    em = params.fetch("input_email")
    pw = params.fetch("input_password")

    student = Student.where({ :email => em }).at(0)

    if student == nil
      redirect_to("/students/sign_in", { :alert => "Student not found"})
    else
      if student.authenticate(pw)
        session.store(:student_id, student.id)

        redirect_to("/", { :notice => "Welcome back, " + student.username + "!"})
      else
        redirect_to("/user_sign_in", { :alert => "Incorrect password, please try again"})
      end
    end
  end
  
  def index
    @students = Student.all.order({ :last_name => :desc })

    render({ :template => "students/index" })
  end

  def show
    #@student = Student.find_by(id: params.fetch("the_username"))
    username = params.fetch("the_username")
    @student = Student.find_by(username: username)
    if @student == nil
      @student = Student.find_by(id: username)
    end
    render({ :template => "students/show" })
  end

  def create
    student = Student.new
    student.first_name = params.fetch("input_first_name")
    student.last_name = params.fetch("input_last_name")
    student.username = params.fetch("input_username")
    student.email = params.fetch("input_email")
    student.password = params.fetch("input_password")
    student.password_confirmation = params.fetch("input_password_confirmation")

    save_status = student.save

    if save_status == true
      session.store(:student_id, student.id)
      redirect_to("/students/#{student.username}", { :notice => "Student created successfully." })
    else
      redirect_to("/students/sign_up", { :notice => "Student failed to create successfully." })
    end
  end

  def update
    the_username = params.fetch("the_username")
    student = Student.where({ :username => the_username}).at(0)

    student.first_name = params.fetch("query_first_name")
    student.last_name = params.fetch("query_last_name")
    student.username = params.fetch("query_username")
    student.email = params.fetch("query_email")

    student.save

    redirect_to("/students/#{student.username}", { :notice => "Student updated successfully." })
  end

  def destroy
    the_username = params.fetch("the_username")
    student = Student.where({ :username => the_username }).at(0)

    student.destroy

    redirect_to("/students", { :notice => "Student deleted successfully."} )
  end
end
