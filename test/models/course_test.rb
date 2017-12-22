require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @admin = users(:one)
    @not_admin = users(:two)
  end

end
