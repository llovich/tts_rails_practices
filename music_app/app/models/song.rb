class Song < ActiveRecord::Base
  belongs_to :artist
  validates :title, presence: true, length: {minimum: 3}
  validates :artist_id, presence: true
  validates_uniqueness_of :title, scope: artist_id
end
