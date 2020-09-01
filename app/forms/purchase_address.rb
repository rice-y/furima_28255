class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :price, :authenticity_token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token, :number, :cvc, :exp_month, :exp_year, :purchase_id

  with_options presence: true do
    validates :address,:token
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :phone_number, numericality: { max_length: 11 }, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
