class ApplicationController < ActionController::Base
  skip_forgery_protection
  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  rescue ActiveRecord::RecordNotFound
    session[:student_id] = nil
  end
  helper_method :current_student
end
