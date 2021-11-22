class List < ApplicationRecord
  belongs_to :user
  has_many :shotguns
  has_many :listed_users, through: :shotguns, source: :user

  CATEGORY = ["coffee", "object", "technology"]
end
