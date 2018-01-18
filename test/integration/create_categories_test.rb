require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @not_admin = users(:two)
    @admin = users(:one)
    @valid_category = Category.new(name: 'Business', shortname: 'BUSI')
    @invalid_category = Category.new(name: 'Not Valid')
  end

  test 'get new category form and create new category' do
    login_as(@admin)
    get '/categories/new'
    assert_response :success, 'Cannot get new category page'
    assert @valid_category.save, 'Valid category does not save'
  end

  test 'invalid category submission results in failure' do
    login_as(@admin)
    get '/categories/new'
    assert_not @invalid_category.save, 'Invalid category saves'
  end

  test 'must be admin to create category' do
    login_as(@not_admin)
    get '/categories/new'
    assert_response :redirect, 'if not admin, redirect from new category form'
    follow_redirect!
    assert_response :success, 'Redirect from new category (not admin) is broken'
  end
end
