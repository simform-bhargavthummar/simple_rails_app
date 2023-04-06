# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_mail
  def welcome_mail
    UserMailer.welcome_mail
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/update_mail
  def update_mail
    UserMailer.update_mail
  end

end
