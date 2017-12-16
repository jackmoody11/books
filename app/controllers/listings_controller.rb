class ListingsController < ApplicationController
 before_action :set_listing, only: [:edit, :update, :destroy, :show]
 before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @listing = Listing.new
  end

  def index
    @listings = Listing.search(params[:search]).paginate(page: params[:page], per_page: 9)
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
   if @listing.save
     flash[:success] = "Your listing was successfully saved."
     redirect_to listing_path(@listing)
   else
     render 'new'
   end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "Your listing was successfully updated."
      redirect_to listing_path(@listing)
    else
      render 'edit'
    end
  end

  def destroy
    @listing.destroy
    flash[:danger] = "Listing was successfully deleted"
    redirect_to listings_path
  end

  private
    def listing_params
      params.require(:listing).permit(:title,:condition,:price,:description,:isbn,:image,:courses, category_ids: [], course_ids: [])
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def require_same_user
      if current_user != @listing.user && !current_user.admin?
        flash[:danger] = "You can only edit or delete your own listing"
        redirect_to root_path
      end
    end

end
