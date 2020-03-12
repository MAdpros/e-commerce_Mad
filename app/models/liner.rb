class Liner < ApplicationRecord
  belongs_to :delivery
  belongs_to :transit

  belongs_to :order

  def total
    if order.zone_id == 4
      transit.price+100
    else
      transit.price
    end
      
  end
end
