require 'test_helper'

class ListingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers
  setup do
    @listing = listings(:one)
  end

end
