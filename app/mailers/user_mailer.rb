class UserMailer < ApplicationMailer

  def welcome
    @user = params[:user]
    p @user
    mail(to: 'lotta-schwarz@outlook.com', subject: "Your order details")
  end
end
