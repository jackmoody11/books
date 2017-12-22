require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Mathematics", shortname: "MATH")
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
    category2 = Category.new(name: "Sports")
    assert_not category2.valid?
  end

  test "name should not be too short" do
    category4 = Category.new(name: "io")
    assert_not category4.valid?
  end

  test "name should not be too long" do
    category5 = Category.new(name: "waytoolongforacategoryblablablablablablablablablablabla
                                    blablablablablablablablablablablablabla
                                    blablablablablablablablablablablablabla")
    assert_not category5.valid?
  end

end
