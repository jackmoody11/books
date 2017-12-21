require 'test_helper'
class CategoriesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  def setup
    sign_in users(:one)
  end

  test "test_the_truth" do
    assert true
  end

  test "should get categories index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
      assert_no_difference 'Category.count' do
        post :create, category: { name: "sports" }
      end
    assert_redirected_to categories_path
  end
end
