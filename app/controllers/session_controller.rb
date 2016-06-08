class SessionController < ApplicationController
  def new
    if current_user
      redirect_to private_dashboard_path
    end
  end

  def oauth_callback
    pp params

    if params[:provider].to_sym == :facebook

      info_hash = facebook_info_hash(params[:code])

      ar = User.arel_table
      user = User.find_by(ar[:facebook_id].eq(info_hash[:id]).
                        or(ar[:email].eq(info_hash[:email]))
                        )

      # create new user
      if user.blank?
        user = User.new
        random_password = random_string

        user.name                  = info_hash[:name]
        user.email                 = info_hash[:email]
        user.facebook_id           = info_hash[:id]
        user.password              = random_string
        #user.password_confirmation = random_string
      end

      # update access_token even if a user already exists
      user.facebook_access_token = info_hash[:access_token]
      unless user.save
        redirect_to oauth_failure
        return
      end

      auto_login(user)
      redirect_to private_dashboard_path
    end

  end

  def oauth_failure
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to root_path, notice: "You logged in!"
    else
      flash.now[:alert] = "Email or password is wrong."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to login_path , notice: 'You logged out.'
  end

  private

  def random_string ( min: 40, max: 50 )
    random_max = (min + rand(max-min))
    chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    random_string = ""
    random_max.times.map{ random_string += chars.sample }
    random_string
  end

  # This function is difficult to test
  def facebook_info_hash code
    # references:
    #  https://developers.facebook.com/docs/facebook-login/manually-build-a-login-flow
    #  http://www.nakamurahiroki.com/2011/02/facebook-apioauth-20.html

    # step 1: send request to get access_token with code
    url = "https://graph.facebook.com/v2.6/oauth/access_token?
        client_id=#{ ENV['FACEBOOK_APPID'] }&
        redirect_uri=#{ oauth_callback_url(provider: :facebook) }&
        client_secret=#{ ENV['FACEBOOK_SECRET'] }&
        code=#{ code }"
    request_hash = get_hash_of_request_json_from(url)
    access_token = request_hash['access_token']

    # step 2: get userid info with access_token
    url = "https://graph.facebook.com/me?
        access_token=#{access_token}&
        fields=name,email,id"
    request_hash = get_hash_of_request_json_from(url)

    {
      access_token: access_token,
      id:    request_hash['id'],
      email: request_hash['email'],
      name:  request_hash['name'],
    }
  end

end
