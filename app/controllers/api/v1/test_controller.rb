module Api
  module V1
    class TestController < ApplicationController
      skip_before_action :verify_authenticity_token

      def geo
        render json: {
                 comment: params[:comment],
                 lat: params[:lat],
                 lng: params[:lng]
               }
      end

    end
  end
end
