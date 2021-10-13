class Record < ApplicationRecord
  #extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :item
  #validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
end
