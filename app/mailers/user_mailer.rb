class UserMailer < ApplicationMailer

  def welcome
    @user = params[:user]
    p @user
    mail(to: @user.email, subject: "Your order details")
  end
end
