class Profile < ApplicationRecord
  has_many :votes

  validates :name, presence: true
  validates :name, uniqueness: true

  scope :random, -> { order('random()') }
  scope :ranked, lambda {
    left_joins(:votes)
    .select(
            'profiles.*',
            'COUNT(case votes.category when 1 then 1 else null end) AS frog_votes',
            'COUNT(case votes.category when 0 then 1 else null end) AS rat_votes',
            'COUNT(profiles.id) AS votes',
            'ABS(COUNT(case votes.category when 1 then 1 else null end) - COUNT(case votes.category when 0 then 1 else null end)) / COUNT(profiles.id)::float AS votes_ratio'
          )
    .group(:id)
  }

  def votes_summary
    ProfileVotesAggregation.new(votes)
  end
end
