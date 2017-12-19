class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :listings, dependent: :destroy
  has_many :categories, through: :listings
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy
  before_save { self.email = email.downcase } # Add titleize or some equivalent to first_name and last_name
  VALID_UNC_EMAIL = /\A[\w+\-.]+@live.unc.edu\z/i
  validates :email, presence: true, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_UNC_EMAIL, message: "You must use a valid @live.unc.edu email" }
  current_year = Time.now.year
  validates :first_name, length: { maximum: 30 }
  validates :last_name, length: { maximum: 30 }
    # Optionals
    validates :summary, length: { maximum: 500 }, allow_nil: true
    validates :grad_year, numericality: { greater_than_or_equal_to: current_year,
                                          less_than_or_equal_to: current_year + 4,
                                          message: "You must be graduating within the next 4 years" },
                                          allow_nil: true
# Assign nickname to user
  def nickname
    if first_name
      first_name
    elsif first_name && last_name
      first_name + " " + last_name
    elsif username
      username
    else
      email.split('@')[0]
    end
  end

end
