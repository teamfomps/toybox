class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :album
  mount_uploader :audio_file, AudioFileUploader
end
