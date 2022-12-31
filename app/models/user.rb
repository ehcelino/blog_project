class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments
  before_create :generate_token
  # validates_uniqueness_of :username

  validates :username, presence: {message: "não pode estar em branco."}, length: { in: 4..14, message: 'tem que ter entre 4 a 14 caracteres.' }, uniqueness: {message: 'já em uso.'}
  validates :email, presence: {message: "não pode estar em branco."}, uniqueness: {message: 'já em uso.'}
  validates :password, presence: {message: "não pode estar em branco."}, length: { in: 3..6, message: 'tem que ter entre 3 a 6 caracteres.' }

  
  
  HUMANIZED_ATTRIBUTES = {
  :email => "Email",
  :password => "Senha", # don't include column name in error
  :username => "Usuário",
  :password_confirmation => "Repita a senha"
}

def self.human_attribute_name(attr, options={})
  HUMANIZED_ATTRIBUTES[attr.to_sym] || super
end


# def generate_token(column)
#   begin
#     self[column] = SecureRandom.urlsafe_base64
#   end while User.exists?(column => self[column])
# end
  def generate_token
    self.auth_token = SecureRandom.hex
  end

end
