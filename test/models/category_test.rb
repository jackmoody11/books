require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Mathematics", shortname: "MATH")
    @name_too_long = Category.new(name: "waytoolongforacategoryblablablablablablablablablablabla
                                    blablablablablablablablablablablablabla
                                    blablablablablablablablablablablablabla", shortname: "ABC")
    @name_too_short = Category.new(name: "io", shortname: "IO")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "category should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "Mathematics", shortname: "MATH")
    assert_not category2.valid?
  end

  test "name should not be too short" do
    assert_not @name_too_short.valid?
  end

  test "name should not be too long" do
    assert_not @name_too_long.valid?
  end

end
