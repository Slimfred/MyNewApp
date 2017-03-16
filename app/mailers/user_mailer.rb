class UserMailer < ApplicationMailer
  default from: "slimfred37@gmail.com"

  def contact_form(email, name, message)
    @message = message
      mail(:from => email,
          :to => 'slimfred37@gmail.com',
          :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Yummy Cookies!"
    mail( :to => user.email,
          :subject => "Welcome to #{@appname}!")
  end

  # def order_recieved(user)
  #   @user = current_user
  #   @appname = "Yummy Cookies!"
  #   mail( :to => user.email,
  #         :from => sales@yummycookies.com
  #         :subject => "Your order with #{@appname}")
  #   )
end
