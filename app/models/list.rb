class List < ApplicationRecord
  belongs_to :user
  has_many :shotguns, dependent: :destroy
  has_many :listed_users, through: :shotguns, source: :user

  validates :name, presence: true
  validates :description, presence: true
  validates :places, presence: true

  def belongs_to_user?(user)
    listed_users.any? { |listed_user| listed_user.id == user.id }
  end
end
