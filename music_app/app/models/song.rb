class Song < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence: true, length: {minimum: 3}
  validates :artist_id, presence: true
end
