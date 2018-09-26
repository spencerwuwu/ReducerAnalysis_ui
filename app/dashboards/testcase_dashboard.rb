require "administrate/base_dashboard"

class TestcaseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    java: Field::Text,
    t1: Field::String,
    t2: Field::String,
    t3: Field::String,
    t4: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    r_type: Field::String,
    compile_error: Field::Number,
    result: Field::Text,
    name: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :t1,
    :t2,
    :t3,
    :t4,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :t1,
    :t2,
    :t3,
    :t4,
    :java,
    :r_type,
    :compile_error,
    :result,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :r_type,
    :java,
    :t1,
    :t2,
    :t3,
    :t4,
    :compile_error,
    :result,
  ].freeze

  # Overwrite this method to customize how testcases are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(testcase)
  #   "Testcase ##{testcase.id}"
  # end
end
