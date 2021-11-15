class SessionController < ApplicationController

  skip_before_action :set_current_user

  def create
    @user = Account.find_by(username: params[:username])

    if(@user)
      if (@user.password == params[:password])
        session[:user_id] = @user.id
        redirect_to account_path(@user)
      else
        message = "Something wrong"
        flash[:notice] = 'Something wrong'
        redirect_to login_path, :flash => { :notice => message }
      end
    else
      message = "Something wrong"
      redirect_to login_path, :flash => { :notice => message }
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to "/login"
  end

end
