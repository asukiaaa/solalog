module Api
  module V1
    class PowerLogController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        access_token = params[:access_token]
        plant = Plant.find_by(access_token: access_token)

        if plant.blank?
          render json: { message: 'invalid token' }, status: 404
          return
        end

        # fill logged_at with current time
        logged_at = params[:logged_at] || Time.zone.now

        power_log =
          plant.power_logs.create(voltage: params[:voltage],
                                  ampere: params[:ampere],
                                  creator_info: request.remote_ip,
                                  logged_at: logged_at )

        unless power_log.persisted?
          render json: { message: 'failed to create log' }, status: 404
          return
        end

        render json: {
          voltage:      power_log.voltage,
          ampere:       power_log.ampere,
          creator_info: power_log.creator_info,
          logged_at:    power_log.logged_at.to_s,
        }
      end

    end
  end
end
