class Recipe < ApplicationRecord
  belongs_to :supermarket

  has_many :orders
  has_many :amounts
end
