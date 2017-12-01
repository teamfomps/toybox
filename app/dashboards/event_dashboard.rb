require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    start_time: Field::DateTime,
    venue_name: Field::String,
    venue_address: Field::String,
    venue_city: Field::String,
    venue_state: Field::String,
    venue_phone: Field::String,
    venue_url: Field::String,
    description: Field::Text,
    open_to_public: Field::Boolean,
    publish: Field::Boolean,
    last_day: Field::DateTime,
    expiration_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :start_time,
    :venue_name,
    :venue_address,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :start_time,
    :venue_name,
    :venue_address,
    :venue_city,
    :venue_state,
    :venue_phone,
    :venue_url,
    :description,
    :open_to_public,
    :publish,
    :last_day,
    :expiration_date,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :start_time,
    :venue_name,
    :venue_address,
    :venue_city,
    :venue_state,
    :venue_phone,
    :venue_url,
    :description,
    :open_to_public,
    :publish,
    :last_day,
    :expiration_date,
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event)
  #   "Event ##{event.id}"
  # end
end
