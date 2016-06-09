class Private::PowerLogsController < PrivateController

  def destroy
    plant = current_user.plants.find_by( uuid: params[:plant_id] )
    if plant.blank?
      raise ActiveRecord::RecordNotFound
      return
    end
    power_log = plant.power_logs.find(params[:id])

    if power_log.destroy
      redirect_to private_plant_path( plant.uuid ),
        note: "Deleted a power log at #{power_log.logged_at.to_s}"
    else
      redirect_to private_plant_path( plant.uuid ),
        alert: "failed to delete log at #{power_log.logger_at.to_s}"
    end
  end

end
