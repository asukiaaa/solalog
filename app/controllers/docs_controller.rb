class DocsController < ApplicationController
  def about
  end

  def iframe
    @plant = Plant.first
  end
end
