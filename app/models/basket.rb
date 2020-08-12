class Basket < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :orders
end
