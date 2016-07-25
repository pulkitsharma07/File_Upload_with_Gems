class FileController < ApplicationController
  before_filter :authenticate_user!, :current_file, except: [:upload]

  def upload
    if params[:upload].nil?
      redirect_to '/', flash: {error: "Please select a file"}
      return
    end

    file_uploaded = current_user.uploaded_files.build
    file_uploaded.file = params[:upload][:datafile]
    file_uploaded.save!
    redirect_to root_path
  end

  def download
    send_file(@current_file.file.path,
              filename: @current_file.file_identifier,
              type: @current_file.file.content_type,
              disposition: 'attachment',
              url_based_filename: true)
  end

  def delete
    @current_file.destroy
    redirect_to root_path
  end

  private

  def current_file
    @current_file ||= current_user.uploaded_files.find(params[:id]) rescue nil

    unless @current_file
      redirect_to root_path
      return
    end
  end
end
