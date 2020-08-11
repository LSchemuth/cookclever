class Supermarket < ApplicationRecord
  belongs_to :user

  has_many :ingredients
  has_many :recipes
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
