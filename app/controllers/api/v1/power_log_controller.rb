module Api
  module V1
    class PowerLogController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        plant = Plant.find_by(api_key: params[:api_key])

        if plant.blank?
          render json: { message: 'invalid token' }, status: 404
          return
        end

        power_log =
          plant.power_logs.new(voltage:      params[:voltage],
                               ampere:       params[:ampere],
                               watt:         params[:watt],
                               logged_at:    params[:logged_at],
                               creator_info: request.remote_ip)
        power_log.fill_watt
        power_log.fill_logged_at
        power_log.save

        unless power_log.persisted?
          render json: { message: 'failed to create log' }, status: 404
          return
        end

        render json: {
          voltage:      power_log.voltage,
          ampere:       power_log.ampere,
          watt:         power_log.watt,
          logged_at:    power_log.logged_at.to_s,
          creator_info: power_log.creator_info,
        }
      end

    end
  end
end
