class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def welcome_email(user)
    @user = user

    @url  = 'http://the-eventbrite-project.fr/login'

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
