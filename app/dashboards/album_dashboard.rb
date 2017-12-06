require "administrate/base_dashboard"

class AlbumDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    songs: Field::HasMany,
    id: Field::Number,
    slug: Field::String,
    title: Field::String,
    short_description: Field::String,
    long_description: Field::String,
    year: Field::Number,
    for_sale: Field::Boolean,
    published: Field::Boolean,
    cover_art: Field::Carrierwave.with_options(
      image: :thumb,
      image_on_index: false,
      multiple: false
    ).freeze,
    digital_download_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    sku: Field::String,
    stripe_id: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :category,
    :songs,
    :id,
    :slug,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :category,
    :songs,
    :id,
    :slug,
    :title,
    :short_description,
    :long_description,
    :year,
    :for_sale,
    :published,
    :cover_art,
    :created_at,
    :updated_at,
    :sku,
    :stripe_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :songs,
    :title,
    :short_description,
    :long_description,
    :year,
    :for_sale,
    :published,
    :cover_art,
    :digital_download_url
  ].freeze

  # Overwrite this method to customize how albums are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(album)
    album.title
  end
end
