class Event < ApplicationRecord
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  belongs_to :location
  belongs_to :category
  has_many :bookings
  has_many :user, through: :bookings, dependent: :destroy
  has_many :notifications, as: :notifiable  

  after_create :create_notification

  private
    def create_notification      
      self.notifications.create(message:"#{self.name} Event is Create")
    end


end
