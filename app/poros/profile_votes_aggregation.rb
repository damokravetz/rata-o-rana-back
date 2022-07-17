class ProfileVotesAggregation
  include ActiveModel::Serialization

  def initialize(votes)
    @votes = votes
  end

  attr_reader :votes

  def self.model_name
    'ProfileVotesAggregation'
  end

  def votes_count
    @votes_count ||= votes.count
  end

  def rat_votes_count
    @rat_votes_count ||= votes.rat.count
  end

  def frog_votes_count
    @frog_votes_count ||= votes.frog.count
  end

  def rat_votes_ratio
    rat_votes_count.to_f / votes_count
  end

  def frog_votes_ratio
   frog_votes_count.to_f / votes_count
  end
end
