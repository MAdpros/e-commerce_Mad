class Article < ApplicationRecord
    has_many :Products
    has_many :types, through: :Products
end
