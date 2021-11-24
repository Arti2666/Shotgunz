class Shotgun < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :list
end
