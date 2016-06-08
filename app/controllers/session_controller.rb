class SessionController < ApplicationController
  def new
    if current_user
      redirect_to private_dashboard_path
    end
  end

  def oauth_facebook
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
end
