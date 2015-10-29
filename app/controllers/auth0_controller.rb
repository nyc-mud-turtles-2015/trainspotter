class Auth0Controller < ApplicationController

  def callback
    curator = Curator.find_or_create_by(uid: request.env['omniauth.auth']['uid'])
    curator.avatar = request.env['omniauth.auth']['info']['image']
    curator.name = request.env['omniauth.auth']['info']['name']
    curator.save
    session[:uid] = curator.uid
    redirect_to root_url
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end

end


