require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    alt_title: Field::String,
    info: Field::Text,
    episodes: Field::String,
    discs: Field::Number,
    details: Field::Text,
    genres: Field::HasMany,
    languages: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    front_uid: DragonflyField,
    back_uid: DragonflyField,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys - [:created_at, :updated_at]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :alt_title,
    :info,
    :episodes,
    :discs,
    :details,
    :genres,
    :languages,
    :front_uid,
    :back_uid,
  ]

  # Overwrite this method to customize how items are displayed
  # across all pages of the admin dashboard.
  
  def display_resource(item)
    "#{item.title}"
  end
end
