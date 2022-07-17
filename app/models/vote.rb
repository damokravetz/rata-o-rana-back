class Vote < ApplicationRecord
  belongs_to :profile

  enum :category, { rat: 0, frog: 1 }

  validates :category, :profile, presence: true
end
