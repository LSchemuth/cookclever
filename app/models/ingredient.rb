class Ingredient < ApplicationRecord
  belongs_to :supermarket

  has_many :amounts

  has_one_attached :photo
end
