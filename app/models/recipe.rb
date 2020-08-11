class Recipe < ApplicationRecord
  belongs_to :supermarket

  has_many :orders
  has_many :amounts


  has_many :ingredients, through: :amounts

  has_one_attached :photo
end
