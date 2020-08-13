class Basket < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :orders

  # after_save :send_confirmation_email

  # private

  # def send_confirmation_email
  #   UserMailer.with(user: self).welcome.deliver_now
  # end
end
