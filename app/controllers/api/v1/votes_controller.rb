module Api
  module V1
    class VotesController < ApplicationController
      before_action :set_votes, only: %i[ create ]

      # POST /votes
      def create
        @vote = @votes.new(vote_params)

        if @vote.save
          render json: @vote, status: :created
        else
          render json: @vote.errors, status: :unprocessable_entity
        end
      end

      private
        
        def set_votes
          @votes = Profile.find(params[:profile_id]).votes
        end

        # Only allow a list of trusted parameters through.
        def vote_params
          params.require(:category)
          params.permit(:category)
        end
    end
  end
end