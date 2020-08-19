class Ingredient < ApplicationRecord
  belongs_to :supermarket

  has_many :amounts
  has_many :ordered_amounts, dependent: :destroy

  has_one_attached :photo
end
