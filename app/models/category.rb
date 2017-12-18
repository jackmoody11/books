class Category < ActiveRecord::Base
  has_many :listing_categories
  has_many :course_categories
  has_many :courses, through: :course_categories
  has_many :listings, through: :listing_categories
  validates :name, presence: true, length: { minimum: 1, maximum: 60 }
  validates :shortname, length: { minimum: 1, maximum: 8 }
  validates_uniqueness_of :name
  validates_uniqueness_of :shortname
end
