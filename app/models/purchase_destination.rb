class PurchaseDestination

  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :token
  
    with_options presence: true do
      validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
      validates :shipping_area_id, numericality: { other_than: 1 , message: "を選択してください"}
      validates :city
      validates :address
      validates :phone_number, format: {with: /\A\d{11}\z|\A\d{10}\z/}
      validates :user_id
      validates :item_id
      validates :token
    end

    def save
      purchase = PurchaseHistory.create(user_id: user_id, item_id: item_id)
      Destination.create(postal_code:postal_code, shipping_area_id:shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase.id )
    end

end
