class OauthCallbacksController < ApplicationController

  def facebook
    ninja = Ninja.find_or_create_by_fb_auth_hash(request.env['omniauth.auth'])

    sign_in(ninja)
    redirect_to ninjas_url
  end

end
