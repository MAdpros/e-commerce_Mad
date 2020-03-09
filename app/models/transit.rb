class Transit < ApplicationRecord
  has_many :liners, dependent: :destroy
end
 