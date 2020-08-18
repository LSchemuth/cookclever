class Order < ApplicationRecord
  belongs_to :basket
  belongs_to :recipe

  has_many :ordered_amounts, dependent: :destroy
end
