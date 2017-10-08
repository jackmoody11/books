class Listing < ApplicationRecord
  belongs_to :user
  has_many :listing_categories
  has_many :categories, through: :listing_categories
  validates :title, presence: true
  validates :condition, presence: true
  validates_inclusion_of :condition, in: ["New", "Used - Like New", "Used - Very Good", "Used - Good", "Used - Acceptable"], presence: true
  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000 }
  validates :description, allow_nil: true, length: { maximum:300 }
  validates :user_id, presence: true
  validates :isbn, allow_nil: true,
                   numericality: {greater_than_or_equal_to: 999999999, less_than_or_equal_to: 9999999999999}

mount_uploader :image, ImageUploader

  # Add basic search
  def self.search(search)
    if search
      where('lower(title) LIKE ?', "%#{search.downcase}%")
    else
      return all
    end
  end

  # Add ISBN lookup
  def self.isbn_lookup(val)
    request = Vacuum.new('US')
    request.configure(
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'], #TURN INTO ENV
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], #TURN INTO ENV
    associate_tag: ENV['AWS_ASSOCIATE_TAG'] #TURN INTO ENV
    )
    response = request.item_lookup(
      query: {
        'ItemId' => val,
        'SearchIndex' => 'Books',
        'IdType' => 'ISBN'
      },
      persistent: true
    )
    fr = response.to_h #returns complete hash
    author = fr.dig("ItemLookupResponse","Items","Item","ItemAttributes","Author")
    title = fr.dig("ItemLookupResponse","Items","Item","ItemAttributes","Title")
    manufacturer = fr.dig("ItemLookupResponse","Items","Item","ItemAttributes","Manufacturer")
    url = fr.dig("ItemLookupResponse","Items","Item","ItemLinks","ItemLink",6,"URL")
    return {title: title, author: author, manufacturer: manufacturer, url: url}
  end


end
