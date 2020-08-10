class Ingredient < ApplicationRecord
  belongs_to :supermarket

  has_many :amounts
end
