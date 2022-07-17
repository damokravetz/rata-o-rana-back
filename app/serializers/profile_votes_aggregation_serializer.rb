class ProfileVotesAggregationSerializer < ActiveModel::Serializer
  attributes :votes_count, :rat_votes_count, :frog_votes_count, :rat_votes_ratio, :frog_votes_ratio
end
