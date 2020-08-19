class OrderedAmount < ApplicationRecord
  belongs_to :ingredient, dependent: :destroy
  belongs_to :order, dependent: :destroy
end
