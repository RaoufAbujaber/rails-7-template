class UploadedFilesController < ApplicationController
  def new
    # Display the form for uploading files
  end

  def create
    # Logic to handle file upload
    uploaded_file = params[:uploaded_file]
    filename = uploaded_file.original_filename
    file_path = Rails.root.join('public', 'uploads', filename)
    username = current_student.username
    course_id = params[:query_course_id].to_i
    
    # Handle case where course_id is nil
    if course_id.blank?
      # Handle the error, possibly redirect back with an error message
      redirect_to uploaded_files_path, alert: 'Please select a course.'
      return
    end

    File.open(file_path, 'wb') do |file|
      file.write(uploaded_file.read)
    end

    UploadedFile.create(filename: filename, file_path: file_path.to_s, username: username, course: Course.find_by(id: course_id))

    redirect_to uploaded_files_path, notice: 'File uploaded successfully'
  end

  def details
    @uploaded_file = UploadedFile.find_by(id: params[:id])

    if @uploaded_file.nil?
      redirect_to some_path, alert: "Uploaded file not found."
      return
    end

    # Additional logic (if any)
  end

  def index
    @uploaded_files = UploadedFile.all
  end

  def destroy
    @uploaded_file = UploadedFile.find_by(id: params[:id])

    if @uploaded_file.nil?
      redirect_to uploaded_files_path, alert: 'File not found.'
      return
    end

    # Optional: Delete the file from the filesystem
    file_path = @uploaded_file.file_path
    File.delete(file_path) if File.exist?(file_path)

    # Delete the record from the database
    @uploaded_file.destroy

    redirect_to uploaded_files_path, notice: 'File deleted successfully.'
  end
end
