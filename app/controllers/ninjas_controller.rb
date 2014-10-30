class NinjasController < ApplicationController
  # before_action :require_signed_in!, :only => [:index]
  before_action :require_signed_out!, :only => [:create, :new]

  def index
    @ninjas = Ninja.all
  end

  def show
    @ninja = Ninja.find(params[:id])
  end

  def new
    @ninja = Ninja.new
  end

  def create
    @ninja = Ninja.new(ninja_params)

    if @ninja.save
      sign_in(@ninja)
      redirect_to ninjas_url
    else
      flash.now[:errors] = @ninja.errors.full_messages
      render :new
    end
  end

  private
  def ninja_params
    params.require(:ninja).permit(:email, :password)
  end
end
