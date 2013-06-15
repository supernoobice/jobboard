class UsersController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @jobs = Job.find_all_by_user_id(current_user)
    @categories = Category.all
  end
end
