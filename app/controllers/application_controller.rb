class ApplicationController < ActionController::Base
  protect_from_forgery

  def is_admin
    unless current_user.admin?
      flash[:alert] = "You are not allowed to view this page"
      redirect_to jobs_path
    end
  end

end
