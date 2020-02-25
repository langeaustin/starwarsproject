class Person < ApplicationRecord
  has_and_belongs_to_many :vehicles
  belongs_to :planet

  validates :name, presence: true
end
