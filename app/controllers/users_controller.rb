class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy, :index]

    def index
      @users = User.paginate(page: params[:page], per_page: 15)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to Books #{@user.username}"
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        bypass_sign_in(@user)
        flash[:success] = 'Your account was updated successfully'
        redirect_to listings_path
      else
        render 'edit'
      end
    end

    def show
      @user_listings = @user.listings.paginate(page: params[:page], per_page: 5)
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = 'User and all articles created by user have been deleted.'
      redirect_to users_path
    end

    private
      def user_params
        params.require(:user).permit(:username, :email,
                                     :password, :first_name,
                                     :last_name, :summary,
                                     :grad_year
                                    )
      end

      def set_user
        @user = User.find(params[:id])
      end

      def require_same_user
        if (!user_signed_in? || current_user != @user) && !current_user.admin?
          flash[:danger] = "You can only edit your own profile"
          redirect_to user_path(@user)
        end
      end

      def require_admin
        if user_signed_in? and !current_user.admin?
          flash[:danger] = "Only admin users can perform that action."
          redirect_to courses_path
        end
      end


end
