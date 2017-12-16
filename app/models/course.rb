class Course < ApplicationRecord
  has_many :course_categories
  has_many :course_listings
  has_many :listings, through: :course_listings, dependent: :destroy
  has_many :categories, through: :course_categories, dependent: :destroy
  validates :shortname, presence: true
  validates_uniqueness_of :shortname
  validates :description, presence: true
end
