class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def about
  end

  def privacy
  end

  def terms
  end
end
