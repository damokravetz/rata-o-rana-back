module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :set_profile, only: %i[ show ]

      # GET /profiles
      def index
        render json: Profile.random.limit(10)
      end

      # GET /profiles/:id
      def show
        render json: @profile
      end

      # GET /profiles/search
      def search # TBD
        render json: { error: 'Endopoint TBD' }, status: :not_found
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_profile
          @profile = Profile.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def profile_params
          params.fetch(:profile, {})
        end
    end
  end
end
