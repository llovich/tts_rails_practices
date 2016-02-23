# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  genre_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bio        :text
#
# Indexes
#
#  index_artists_on_genre_id  (genre_id)
#

class Artist < ActiveRecord::Base
  belongs_to :genre
  has_many :songs
  validates :name, presence: true, length: {minimum: 2}, uniqueness: true
  validates :genre_id, presence: true
end
