class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listings, dependent: :destroy
  has_many :categories, through: :listings
  before_save { self.email = email.downcase}
  VALID_UNC_EMAIL = /\A[\w+\-.]+@live.unc.edu\z/i
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_UNC_EMAIL, message: "You must use a valid @live.unc.edu email" }
    current_year = Time.now.year
    validates :first_name, length: {maximum: 20}, allow_nil: true
    validates :last_name, length: {maximum: 20}, allow_nil: true
    # Optionals
    validates :summary, length: { maximum: 500}, allow_nil: true
    validates :grad_year, numericality: { greater_than_or_equal_to: current_year,
                                          less_than_or_equal_to: current_year + 4,
                                          message: "You must be graduating within the next 4 years" },
                                          allow_nil: true

end
