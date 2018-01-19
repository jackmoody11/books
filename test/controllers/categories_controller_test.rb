require 'test_helper'
class CategoriesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  def setup
    sign_in users(:one)
  end

  test 'admin can get index categories page' do
    get :index
    assert_response :success
  end

  test 'admin can get new categories page' do
    get :new
    assert_response :success
  end

  test 'category does not save without name' do
    category = Category.new(shortname: 'ABCD')
    assert_not category.save
  end

  test 'category does not save without shortname' do
    category = Category.new(name: 'ABCD Class')
    assert_not category.save
  end

  test 'proper category saves' do
    category = Category.new(name: 'ABCD Class', shortname: 'ABCD')
    assert category.save
  end
end
