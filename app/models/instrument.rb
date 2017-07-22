class Instrument < ApplicationRecord
  mount_uploader :picture, CoverArtUploader
end
