class Api::NinjasController < ApplicationController

  def index
    @ninjas = Ninja.all
  end

end