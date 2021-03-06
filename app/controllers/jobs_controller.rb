class JobsController < ApplicationController
  def index
    if params[:cat]
      @category = Category.find_by_name(params[:cat])
      @jobs = @category.jobs
    elsif params[:search]
      @search = params[:search]
      @jobs = Job.all(:conditions => ['title LIKE ?', "%#{@search}%"])
    else
      @jobs = Job.all
    end

  end

  def show
    @job = Job.find(params[:id])
    @title = @job.title
  end

  def new
    if user_signed_in?
      @job = Job.new
    else
      flash[:alert] = "Please login or Sign Up to post a job. :)"
      redirect_to new_user_session_path
    end
  end

  def create
    params[:job][:user_id] = current_user.id
    @job = Job.new(params[:job])

    if @job.save
      flash[:notice] = "Congratulations! You created a new job post."
      me = FbGraph::User.me("x")
      me.feed!( :message => "A new job has been posted! #{@job.title}", :link => "http://shielded-caverns-4260.herokuapp.com/jobs/#{@job.id}" )
      redirect_to jobs_path
    else
      render :action => :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      flash[:notice] = "Update successful."
      redirect_to job_path(@job)
    else
      render :action => :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.delete
      flash[:notice] = "Successfully deleted."
      redirect_to users_profile_path
    end
  end
end
