require "administrate/base_dashboard"

class InstrumentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    slug: Field::String,
    picture: Field::Carrierwave.with_options(
      image: :thumb,
      image_on_index: false,
      multiple: false
    ).freeze,
    short_description: Field::String,
    long_description: Field::Text,
    price_in_pennies: Field::Number,
    for_sale: Field::Boolean,
    published: Field::Boolean,
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
    :id,
    :name,
    :slug,
    :picture,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :slug,
    :picture,
    :short_description,
    :long_description,
    :price_in_pennies,
    :for_sale,
    :published,
    :created_at,
    :updated_at,
    :sku,
    :stripe_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :slug,
    :picture,
    :short_description,
    :long_description,
    :price_in_pennies,
    :for_sale,
    :published,
    :sku,
    :stripe_id,
  ].freeze

  # Overwrite this method to customize how instruments are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(instrument)
    instrument.name
  end
end
