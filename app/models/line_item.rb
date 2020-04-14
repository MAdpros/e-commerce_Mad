class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :user

  def total
    product.price * quantity
  end
end
