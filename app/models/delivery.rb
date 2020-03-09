class Delivery < ApplicationRecord
  belongs_to :user
  has_many :liners, dependent: :destroy

    def restreint_transit(transit)
      item = liners.find_by(transit: transit)

      if item
        item
      else
        item = liners.new(transit: transit)
      end

      item
    end


    def total
      liners.to_a.sum(&:total)
    end
end
