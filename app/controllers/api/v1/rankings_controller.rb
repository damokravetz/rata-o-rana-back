module Api
  module V1
    class RankingsController < ApplicationController
      before_action :set_ranked_profiles, :validate_order_params, only: %i[ index ]

      def index
        render json: @ranked_profiles.order(order_params),
               each_serializer: ProfilesShowSerializer, status: :ok
      end

      private

        def set_ranked_profiles
          @ranked_profiles = Profile.ranked
        end

        def validate_order_params
          raise_unprocessable_entity(:order) unless param_inclusion?(:order, %w[ votes frog_votes rat_votes votes_ratio ])
          raise_unprocessable_entity(:as) unless param_inclusion?(:as, %w[ asc desc ])
        end

        def order_params
          order = params.fetch(:order, 'votes')
          as = params.fetch(:as, 'desc')
          { order => as }
        end
    end
  end
end
