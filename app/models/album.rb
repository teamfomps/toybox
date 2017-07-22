class Album < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :category
  has_many :songs
  mount_uploader :cover_art, CoverArtUploader
end
