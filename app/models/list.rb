require 'date'

class List < ApplicationRecord
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :shotguns, dependent: :destroy
  has_many :listed_users, through: :shotguns, source: :user

  validates :name, presence: true, length: { maximum: 12 }
  validates :description, presence: true, length: { maximum: 280 }
  validates :places, presence: true

  scope :active, -> { where("start_time < ? AND end_time > ?", DateTime.now, DateTime.now) }
  scope :public_lists, -> { where("public = true") }
  scope :private_lists, -> { where("public= false") }

  def belongs_to_user?(user)
    listed_users.include? user
  end

  CATEGORY = ["Sports ⚽️", "Game 🃏", "Promo 💥", "Party 🥳", "Product 🚀", "Holiday 😎", "Food 🍕", "Other 👥"]
end
