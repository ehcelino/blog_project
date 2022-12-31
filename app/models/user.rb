class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  validates_uniqueness_of :username
  before_create :generate_token
  
# def generate_token(column)
#   begin
#     self[column] = SecureRandom.urlsafe_base64
#   end while User.exists?(column => self[column])
# end
  def generate_token
    self.auth_token = SecureRandom.hex
  end

end
