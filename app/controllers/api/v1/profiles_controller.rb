module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :set_profile, only: %i[ show ]
      before_action :search_profile, only: %i[ search ]

      # GET /profiles
      def index
        render json: Profile.random.limit(10)
      end

      # GET /profiles/:id
      def show
        render json: @profile, serializer: ProfilesShowSerializer
      end

      # GET /profiles/search
      def search
        render json: @profile, status: :ok
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_profile
          @profile = Profile.find(params[:id])
        end

        def search_profile
          @profile = ProfileGenerator.call(squery: params.require(:q))
        end
    end
  end
end
