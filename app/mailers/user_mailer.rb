class UserMailer < ApplicationMailer

  def welcome

    mail(to: @user.email, subject: "Your order details")
  end
end
