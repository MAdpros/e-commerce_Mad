class UserMailer < ApplicationMailer
  default from: 'applicationt13@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'https://shrouded-depths-33759.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
