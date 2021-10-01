class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :email, format: {with: /\A\S+@\S+\.\S+\z/}, presence: true
  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, presence: true
  validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}, presence: true
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}, presence: true
  validates :last_name_kana, format: {with: /\A[ァ-ヶ一-]+\z/}, presence: true
  validates :first_name_kana, format: {with: /\A[ァ-ヶ一-]+\z/}, presence: true
  validates :birth_date, presence: true
end
