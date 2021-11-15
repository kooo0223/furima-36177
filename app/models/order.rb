class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :record_id, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid' }
    validates :city
    validates :address_line
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :phone_number,
            length: { minimum: 10, maximum: 11 }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line: address_line,
                   building: building, phone_number: phone_number, record_id: record.id)
  end
end
