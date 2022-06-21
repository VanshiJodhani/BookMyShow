class Location < ApplicationRecord
  belongs_to :city
  has_many :events

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :capacity, presence: true

end
