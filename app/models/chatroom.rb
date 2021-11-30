class Chatroom < ApplicationRecord
  belongs_to :list
  has_many :messages, dependent: :destroy
end
