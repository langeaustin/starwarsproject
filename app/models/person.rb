class Person < ApplicationRecord
  has_and_belongs_to_many :vehicles
  belongs_to :planet
  belongs_to :beer

  validates :name, presence: true
end
