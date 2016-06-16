class DocsController < ApplicationController
  def about
    @plant = Plant.first
  end

  def iframe
    @plant = Plant.first
  end
end
