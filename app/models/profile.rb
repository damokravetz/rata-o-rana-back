class Profile < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  scope :random, -> { order('random()') }
 end
