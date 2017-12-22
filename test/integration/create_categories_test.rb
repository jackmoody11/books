require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    sign_in users(:one)
  end

#  test "get new category form and create new category" do

#  end

#  test "invalid category submission results in failure" do

#  end

end
