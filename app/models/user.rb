class User < ActiveRecord::Base
  has_secure_password

  has_many :adds
  has_many :songs, through: :adds

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, presence: true, length:{ minimum: 2}
  validates :password, length: { minimum: 4 }, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  def full_name
  	"#{self.first_name} #{self.last_name}"
  end
end
