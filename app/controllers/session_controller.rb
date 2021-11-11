class SessionController < ApplicationController
  def index

  end
  
  def create
    @user = Account.find_by(username: params[:username])
    # puts "------------------------------------------------"
    # puts params[:password]
    # puts @user.password
    # puts "------------------------------------------------"
    if(@user)
      if (@user.password == params[:password])
        session[:user_id] = @user.id
        redirect_to accounts_path
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
end
