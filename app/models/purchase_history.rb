class PurchaseHistory < ApplicationRecord
  has_one :Destination
  belongs_to :user
  belongs_to :item

end
