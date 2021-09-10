class SessionsController < ApplicationController
    
    # Trang Dang nhap
    def new

    end
  
    #Hoan tat dang nhap
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        if user.activated?
          flash[:success] = 'Hello'
          log_in user
          #remember user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user) # Tich checkbox -> luu->dong trinh duyet mo lai web van giu nguyen 
                                                                                # con khong tich checkbox -> khi mo lai web se khong luu tai khoan
          #redirect_to user 
          redirect_back_or user
        else
          message = "Account not activated. "
          message += "Check your email for the activation link."
          flash[:warning] = message
          redirect_to root_url
        end
      else
        flash[:danger] = 'Invalid email/password combination' # Canh bao email hoac mat khau ko dung
        render 'new'
      end
    end
  
    # Xoa phien(sessions), dang xuat
    def destroy
      log_out
      redirect_to root_path
    end
  
end
