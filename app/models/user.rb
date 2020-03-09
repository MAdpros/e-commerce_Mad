class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :welcome_send
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :cart
  has_one :delivery

  has_many :comments, dependent: :destroy


  

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
