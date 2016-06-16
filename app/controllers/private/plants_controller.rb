class Private::PlantsController < PrivateController
  include RandomString
  POWER_LOGS_PER_PAGE = 100

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new( plant_params )
    if @plant.save
      current_user.plants << @plant
      redirect_to private_plant_path( @plant )
    else
      flash[:alert] = 'crate error'
      flash.now
      render :new
    end
  end

  def show
    @plant = target_plant
    @power_logs = target_plant.power_logs
      .page(params[:page])
      .per(POWER_LOGS_PER_PAGE)
  end

  def edit
    @plant = target_plant
  end

  def update
    @plant = target_plant
    if @plant.update( plant_params )
      redirect_to private_plant_path( @plant )
    else
      flash[:alert] = 'update error'
      flash.now
      render :edit
    end
  end

  def destroy
    @plant = target_plant
    @plant.destroy
    redirect_to private_dashboard_path, note: "\"#{@plant.name}\" was deleted."
  end

  private

  def target_plant
    plant = current_user.plants.find( params[:id] )
    raise ActiveRecord::RecordNotFound and return if plant.blank?
    plant
  end

  def plant_params
    params.require( :plant ).permit( :name, :description )
  end

end
