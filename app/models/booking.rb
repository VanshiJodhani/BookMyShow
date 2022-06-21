class Booking < ApplicationRecord
  validates :capacity, presence: true
  validates :status, presence: true

  belongs_to :user
  belongs_to :event
  has_many :notifications, as: :notifiable
  enum status: { panding: 0, confirm: 1, cancel:2 }

  after_create :create_booking

  private
    def create_booking      
      self.notifications.create(message:"#{self.user.name}'s #{self.event.name} event booking is #{self.status}")
    end

  after_update :create_booking

  private
    def create_booking      
      self.notifications.create(message:"#{self.user.name}'s #{self.event.name} event booking is #{self.status}")
    end
end
