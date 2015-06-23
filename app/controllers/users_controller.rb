class UsersController < ApplicationController
  def login
     if session[:user_id] != nil
     	redirect_to "/todos/index"
     end  
  end
  

  def signin
      @user=User.find_by_username_and_password(params[:username],params[:password])
      if @user.present? == true
      	session[:user_id]=@user.id
      redirect_to "/todos/index" and return     	
      end
      flash[:error]="Error"
      redirect_to :action => 'login' 
  end


  def new_user
  end

  def make_new_account
    if (params[:username].blank? || params[:password].blank? || params[:confirm_password].blank?) 
     flash[:error]="One of the fields is empty"
    redirect_to :action => 'new_user' and return
   end
    
   if User.find_by_username(params[:username]).present? == true
   	flash[:error]="Username already exists"
    redirect_to :action => 'new_user' and return
   end
   
   if params[:password]!=params[:confirm_password]
   	flash[:error]="Passwords do not match"
    redirect_to :action => 'new_user' and return
   end

    u=User.create(:username => params[:username], :password => params[:password])
    flash[:success]="Account Created, Login to continue"
  	redirect_to :action => 'login' 
  end


  def logout
  	session[:user_id] = nil
  	flash[:success]="Successfully Logged out"
  	redirect_to :action => 'login'
  end
  
end
