class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :songs
  validates :name, presence: true, length: {minimum: 2}, uniqueness: true
  validates :genre_id, presence: true
end
