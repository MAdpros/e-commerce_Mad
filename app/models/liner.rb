class Liner < ApplicationRecord
  belongs_to :delivery
  belongs_to :transit

  def total
    transit.price
  end
end
