class UserMailer < ApplicationMailer

  def welcome
    @user = params[:user]
    mail(to: @user.email, subject: "Your order details")
  end
end
