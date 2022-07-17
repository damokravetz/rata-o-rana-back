class ProfilesShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at, :updated_at
  has_one :votes_summary, serializer: ProfileVotesAggregationSerializer
end
