class Ticket < ApplicationRecord
  belongs_to :project
  validates :name, :description, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
