class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :supermarkets
  has_many :baskets

  after_create :create_basket, :send_welcome_email

  def create_basket
    Basket.create(user_id: self.id)
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
