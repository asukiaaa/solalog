class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])

    if params[:embedded]
      @target_type = params[:target_type]
      render template: 'plants/show_iframe', layout: "iframe"
    end

  end
end
