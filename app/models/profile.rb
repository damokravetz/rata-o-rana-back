class Profile < ApplicationRecord
  has_many :votes

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :random, -> { order('random()') }

  def votes_summary
    ProfileVotesAggregation.new(votes)
  end
end
