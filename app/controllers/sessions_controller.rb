class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
    # return redirect_to(session_create)
  end

  def create
    user = User.find_by username: params[:username]

    unless user && user.authenticate(params[:password])
      return redirect_to :back, notice: "Username and password mismatch"
    end

    if user.blocked?
      redirect_to :back, notice: "Your account is frozen, please contact admin"
    else
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    end
  end

  def destroy
    # nollataan sessio
    session[:user_id] = nil
    # uudelleenohjataan sovellus pääsivulle
    redirect_to :root
  end
end