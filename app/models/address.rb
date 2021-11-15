class Address < ApplicationRecord
  # with_options presence: true do
  #  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #  validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid"}
  # end

  # validates :prefecture_id,  numericality: { other_than: 1, message: "can't be blank" }
  # validates :city,           presence: true
  # validates :address_line,   presence: true

  belongs_to :record
end
