class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs, through: :artists
  validates :name, presence: true, length: {minimum: 3}, uniqueness: true
end
