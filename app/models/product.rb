class Product < ApplicationRecord
    belongs_to :type
    belongs_to :article

    has_many :line_items, dependent: :nullify
    has_many :likes, dependent: :destroy
end
