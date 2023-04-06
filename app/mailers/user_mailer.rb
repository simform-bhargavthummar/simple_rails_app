class UserMailer < ApplicationMailer

  def welcome_mail(user)
    get_details(user)
    mail( 
      to: @email, 
      subject: "Welcome Email"
    )
  end

  def update_mail(user)
    get_details(user)
    mail( 
      to: @email, 
      subject: "Changing email"
    )
  end

  private
    def get_details(user)
      @user = user
      @email = @user.email
      @name = @user.name
      @greeting = "Hi"
    end
end
