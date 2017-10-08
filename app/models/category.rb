class Category < ActiveRecord::Base
  has_many :listing_categories
  has_many :listings, through: :listing_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 10 }
  validates_uniqueness_of :name
end
