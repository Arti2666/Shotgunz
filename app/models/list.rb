require 'date'

class List < ApplicationRecord
  belongs_to :user
  has_many :shotguns, dependent: :destroy
  has_many :listed_users, through: :shotguns, source: :user

  validates :name, presence: true
  validates :description, presence: true
  validates :places, presence: true

  scope :active, -> { where("start_time < ? AND end_time > ?", DateTime.now, DateTime.now) }

  def belongs_to_user?(user)
    listed_users.include? user
  end

  CATEGORY = ["Sports ⚽️", "Game 🃏", "Promo 💥", "Party 🥳", "Product 🚀", "Holiday 😎", "Food 🍕", "Other 👥"]
end
