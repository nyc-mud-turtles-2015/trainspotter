class Auth0Controller < ApplicationController

  def callback
    curator = Curator.find_or_create_by(uid: request.env['omniauth.auth']['uid'])
    #Note: the name attribute is being updated properly, but the avatar attribute is not being updated properly
    curator.update_attributes(avatar: request.env['omniauth.auth']['info']['image'], name: request.env['omniauth.auth']['info']['name'])
        curator.username = Faker::Internet.user_name('butch')

    curator.save
    session[:uid] = curator.uid
    redirect_to welcome_path
  end

  def failure
    @error_msg = request.params['message']
  end

end


