class Delivery < ApplicationRecord
  belongs_to :user
  has_many :liners, dependent: :destroy

    def restreint_transit(transit, order)
      item = liners.find_by(transit: transit, order: order)

      if item
        item
      else
        item = liners.new(transit: transit, order: order)
      end

      item
    end


    def total
      liners.to_a.sum(&:total)
    end
end
