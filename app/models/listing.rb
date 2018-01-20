class Listing < ApplicationRecord
  # include HTTParty
  belongs_to :user
  has_many :listing_categories
  has_many :listing_courses
  has_many :course_listings
  has_many :courses, through: :course_listings, dependent: :destroy
  has_many :categories, through: :listing_categories, dependent: :destroy
  validates :title, presence: true
  validates :condition, presence: true
  validates_inclusion_of :condition, in: ['New', 'Used - Like New', 'Used - Very Good', 'Used - Good', 'Used - Acceptable'], presence: true
  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
  validates :description, allow_nil: true, length: { maximum:300 }
  validates :user_id, presence: true
  validates :isbn, allow_nil: true,
                   numericality: {greater_than_or_equal_to: 999999999, less_than_or_equal_to: 9999999999999}

  mount_uploader :image, ImageUploader
  validates_size_of :image, maximum: 10.megabyte, message: 'Attachment size exceeds the allowable limit (10 MB).'
  # Add basic search
  def self.search(search)
    if search
      where('lower(title) LIKE ?', "%#{search.downcase}%")
    else
      return all
    end
  end

  # Add ISBN lookup
  def self.amazon_lookup(val)
    request = Vacuum.new('US')
    request.configure(
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    associate_tag: ENV['AWS_ASSOCIATE_TAG']
    )
    response = request.item_lookup(
      query: {
        'ItemId' => val,
        'SearchIndex' => 'Books',
        'IdType' => 'ISBN',
        'ResponseGroup' => 'ItemAttributes, Offers',
      },
      persistent: true
    )
    fr = response.to_h #returns complete hash
    author = fr.dig('ItemLookupResponse','Items','Item','ItemAttributes','Author')
    title = fr.dig('ItemLookupResponse','Items','Item','ItemAttributes','Title')
    manufacturer = fr.dig('ItemLookupResponse','Items','Item','ItemAttributes','Manufacturer')
    url = fr.dig('ItemLookupResponse','Items','Item','ItemLinks','ItemLink',6,'URL')
    # Amount times 100
    new_price = fr.dig('ItemLookupResponse', 'Items','Item', 'ItemAttributes', 'ListPrice', 'Amount').to_f
    new_trade_in = fr.dig('ItemLookupResponse', 'Items','Item', 'ItemAttributes', 'TradeInValue', 'Amount').to_f
    new_price_low = fr.dig('ItemLookupResponse', 'Items','Item', 'OfferSummary', 'LowestNewPrice', 'Amount').to_f
    used_price_low = fr.dig('ItemLookupResponse', 'Items','Item', 'OfferSummary', 'LowestUsedPrice', 'Amount').to_f
    # URLs
    all_offers_url = fr.dig('ItemLookupResponse', 'Items', 'Item', 'Offers', 'MoreOffersUrl')
    # Proper float value
    new_trade_in = new_trade_in ? new_trade_in / 100 : nil
    new_price = new_price ? new_price / 100 : nil
    new_price_low = new_price_low ? new_price_low / 100 : nil
    used_price_low = used_price_low ? used_price_low / 100 : nil
    return { title: title, author: author,
             manufacturer: manufacturer,
             url: url, new_trade_in: newTradeIn,
             new_price: new_price, new_price_low: new_price_low,
             used_price_low: used_price_low,
             all_offers_url: all_offers_url, isbn: val
           }
  end
end
