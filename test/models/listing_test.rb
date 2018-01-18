require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  def setup
    @not_admin = users(:two)
    @admin = users(:one)
    @valid_listing = Listing.new(title: 'Valid Title', price: 123,
                                 condition: 'Used - Like New',
                                 user: @not_admin)
    @invalid_listing_price = Listing.new(title: 'Valid Title',
                                         condition: 'Used - Like New',
                                         user: @not_admin)
    @invalid_listing_title = Listing.new(price: 123,
                                         condition: 'Used - Like New',
                                         user: @not_admin)
    @invalid_listing_condition = Listing.new(title: 'Valid Title',
                                             price: 123,
                                             user: @not_admin,
                                             condition: 'Not a choice')
    @listing_no_condition = Listing.new(title: 'Valid Title',
                                        price: 123, user: @not_admin)
    @invalid_listing_user = Listing.new(title: 'Valid Title', price: 123,
                                        condition: 'Used - Like New')
  end

  test 'successfully create listing' do
    assert @valid_listing.save,
           'valid listing does not save for normal users'
  end

  test 'listing without price does not save' do
    assert_not @invalid_listing_price.save,
               'listing without price saves'
  end

  test 'listing without title does not save' do
    assert_not @invalid_listing_title.save,
               'listing without title saves'
  end

  test 'listing without condition does not save' do
    assert_not @invalid_listing_condition.save,
               'listing without acceptable condition saves'
    assert_not @listing_no_condition.save,
               'listing with no condition saves'
  end

  test 'listing without user does not save' do
    assert_not @invalid_listing_user.save,
               'listing without user saves'
  end
end
