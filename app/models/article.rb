class Article < ApplicationRecord
     has_one_attached :picture
    
    has_many :Products
    has_many :types, through: :Products

   
end
