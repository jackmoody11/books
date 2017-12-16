class CoursesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_course, only: [:edit, :update, :destroy, :show]
  def index
    @categories = Category.all
    @course = Course.paginate(page: params[:page], per_page: 15)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
    flash[:success] = "Course was created successfully"
    redirect_to courses_path
    else
      render 'new'
    end
  end

  def show
    @course = Course.find(params[:id])
    @course_listings = @course.listings.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def destroy
    @course.destroy
    flash[:danger] = "Course was successfully deleted"
    redirect_to courses_path
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      flash[:success] = "Course successfully updated."
      redirect_to courses_path
    else
      render 'edit'
    end
  end

private
  def course_params
    params.require(:course).permit(:shortname, :description, category_ids: [])
  end

  def require_admin
    if !user_signed_in? || (user_signed_in? and !current_user.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end

  def set_course
    @course = Course.find(params[:id])
  end

end
