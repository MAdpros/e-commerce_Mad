class Cart < ApplicationRecord
    belongs_to :user
    has_many :line_items, dependent: :destroy

    def add_products(product)
        item = line_items.find_by(product: product)

        if item
            item.quantity += 1
        else
            item = line_items.new(product: product)
        end

    end

    def total
        line_items.to_a.sum(&:total)
    end

    def add_product(product)
        current_item = line_items.find_by(product_id: product.id)
        if current_item
        current_item.quantity += 1
        else
        current_item = line_items.build(product_id: product.id)
        end
        current_item
    end

  def remove_product(product)
    
    current_item = line_items.find_by(product_id: product.id)

    if current_item.quantity > 1
      current_item.quantity -= 1
    elsif current_item.quantity = 1
      current_item.destroy
    end
    current_item
  end
end
