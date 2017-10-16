class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    render template: "pages/#{params[:page]}"
  end

  def home
    render 'home'
  end

  def about
    render 'about'
  end

  def contact
    render 'contact'
  end

  def terms
    render 'terms'
  end

  def privacy
    render 'privacy'
  end
end
