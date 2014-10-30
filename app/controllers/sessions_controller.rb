class SessionsController < ApplicationController
  before_action :require_signed_out!, :only => [:new, :create]
  before_action :require_signed_in!, :only => [:destroy]

  def new
  end

  def create
    @ninja = Ninja.find_by_credentials(
      params[:email],
      params[:password]
    )

    if @ninja
      sign_in(@ninja)
      redirect_to ninjas_url
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end
end
