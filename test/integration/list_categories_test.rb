require 'test_helper'
class ListCategoriesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @category = Category.find_by(shortname: "ENGL")
    @category2 = Category.find_by(shortname: "COMP")
  end

end
