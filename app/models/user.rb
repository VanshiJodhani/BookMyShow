class User < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-z" "A-Z]+\z/, message: "only allows letters" }
  validates :phone, presence: true, length: { maximum: 10 }, numericality: {  message: "only allows number" }
  validates :email, presence: true
  
  has_and_belongs_to_many :roles, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :events, through: :bookings, dependent: :destroy
end
