require 'test_helper'
class ListCategoriesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @category = Category.find_by(shortname: "ENGL", name: "English")
    @category2 = Category.find_by(shortname: "COMP", name: "Computer Science")
  end

end
