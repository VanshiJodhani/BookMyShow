class City < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-z" "A-Z]+\z/, message: "only allows letters" }

  has_many :locations
end
