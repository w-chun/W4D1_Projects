class Artwork < ApplicationRecord
  validates :title, uniqueness: {scope: :artist_id}, presence: true

  belongs_to :artist,
  class_name: :User,
  primary_key: :id,
  foreign_key: :artist_id

  has_many :artwork_shares,
  class_name: :ArtworkShare,
  primary_key: :id,
  foreign_key: :artwork_id

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer
end
