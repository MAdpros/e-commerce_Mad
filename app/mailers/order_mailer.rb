class OrderMailer < ApplicationMailer
  default from: 'applicationt13@gmail.com'

  def order_email(order)
    @order
    @order = order
    @url = 'http://monsite.fr/login'

    emails = [@order.email, 'applicationt13@gmail.com']
   
    mail(to: emails, subject: 'Bienvenue chez nous !')
  end
end
