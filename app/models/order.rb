class Order < ApplicationRecord
  belongs_to :basket
  belongs_to :recipe
end
