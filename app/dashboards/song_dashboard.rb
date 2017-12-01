require "administrate/base_dashboard"

class SongDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    album: Field::BelongsTo,
    id: Field::Number,
    slug: Field::String,
    track_number: Field::Number,
    lyrics: Field::Text,
    credits: Field::Text,
    title: Field::String,
    audio_file: Field::Carrierwave.with_options(
      image: nil,
      image_on_index: false,
      multiple: false
    ).freeze,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :album,
    :id,
    :slug,
    :track_number,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :album,
    :id,
    :slug,
    :track_number,
    :lyrics,
    :credits,
    :title,
    :audio_file,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :album,
    :slug,
    :track_number,
    :lyrics,
    :credits,
    :title,
    :audio_file,
  ].freeze

  # Overwrite this method to customize how songs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(song)
  #   "Song ##{song.id}"
  # end
end
