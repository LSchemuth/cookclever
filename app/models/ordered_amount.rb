class OrderedAmount < ApplicationRecord
  belongs_to :ingredient
  belongs_to :order
end
