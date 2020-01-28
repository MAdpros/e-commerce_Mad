class Type < ApplicationRecord
    has_many :products
    has_many :articles, through: :products
end
