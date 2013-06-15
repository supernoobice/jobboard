class CategoriesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_admin                                                                                                # application controller

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to users_profile_path
    else
      render :action => :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to users_profile_path
    else
      render :action => :edit
    end
  end

  def destroy
    @category = Category.destroy(params[:id])
    if @category
      redirect_to users_profile_path
    end
  end

end
