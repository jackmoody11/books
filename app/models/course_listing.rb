class CourseListing < ActiveRecord::Base
  belongs_to :listing
  belongs_to :course
end
