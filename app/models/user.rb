class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :supermarkets
  has_many :baskets

  after_create :create_basket

  def create_basket 
    Basket.create(user_id: self.id)
  end
end
