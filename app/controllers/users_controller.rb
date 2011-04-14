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
   
    respond_to do |format|

              if(params[:email_address].nil? || params[:email_address] == "Enter your email address")
                format.js {render :partial=>'errors' , :locals=>{:err=>'Email cannot be blank'}}
              else
                if(User.exists?(:email_address=>params[:email_address]))
                  format.js {render :partial=>'errors' , :locals=>{:err=>'This email has been already subscribed!'}}
                else
                  @user = User.new(:email_address=>params[:email_address])
                   if @user.save
                     format.js {render :partial=>'success'}
                    else
                       format.js {render :partial=>'errors' , :locals=>{:err=>'Invalid Email address'}}
                    end
                  end
                end
           end
   
  end

  def subscribe
    
  end

end
