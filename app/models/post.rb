class Post < ApplicationRecord
  belongs_to :user
  # dependent: :destroy apaga os comments relacionados
  # a um post junto com o post
  has_many :comments, dependent: :destroy
end
