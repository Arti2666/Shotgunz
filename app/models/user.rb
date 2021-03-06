class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists
  has_many :shotguns
  has_many :messages

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 14 }
end
