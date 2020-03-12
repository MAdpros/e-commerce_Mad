class Liner < ApplicationRecord
  belongs_to :delivery
  belongs_to :transit

  belongs_to :order

  def total
    # if order.zone_id = 1...5
    #   transit.price+100
    # elsif order.zone_id = 6...9
    #   transit.price+200
    # end
      
    case order.zone_id
    when 1..5
      transit.price+10
    when 6..9
      transit.price+100
    when 10..31
      transit.price+1000
    else
      
    end
  end
end
