class UserMailer < ApplicationMailer

  def welcome

    mail(to: "luissa.schemuth@outlook.com", subject: "Your order details")
  end
end
