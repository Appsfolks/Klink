class UsersController < ApplicationController
  
  def index
    if params[:codeword] == "kpbhat"
      @users = User.all
    else
      @users = nil
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Subscribed Succesfully'
    else
      flash[:error] = 'There is an error occured, please try again later'
    end
    respond_to do |format|
                    format.html { redirect_to root_path }
                    format.js
    end
    
  end

  def subscribe
    
  end

end
