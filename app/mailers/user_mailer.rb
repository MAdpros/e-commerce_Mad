class UserMailer < ApplicationMailer

    default from: 'no-reply@test.com'
    def welcome_email(user)
        @user = user
        @url = 'https://shrouded-depths-33759.herokuapp.com'
        mail(to: @user.email, subject: 'Bienvenue chez nous !')
    end
end
