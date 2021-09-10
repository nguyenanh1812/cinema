class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :logged_in_user, only: [:index, :edit, :update]
    before_action :correct_user, only: [:edit, :update] #Update dung nguoi dung dang dang nhap

    def index
        #@users = User.all  
        @pagy, @users = pagy(User.all, items: 5)
    end
    def show
        @user = User.find(params[:id])
    end
    def new
        @user = User.new
    end
    def edit
        @user = User.find(params[:id]) 
    end
    def create
        @user = User.new(user_params)
          if @user.save
            #@user.send_activation_email
            ExampleMailer.sample_email(@user).deliver
            #log_in @user # khi dang ki thanh cong thi dang nhap luon
            flash[:success] = "Welcome to cgv!"
            #flash[:info] = "Please check your email to activate your account."
            redirect_to root_url
          else
            #format.html { render :new, status: :unprocessable_entity }
            #format.json { render json: @user.errors, status: :unprocessable_entity }
            render 'new'  
          end
        #end
    end
    def update
        
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email,:password) 
    end

    # Xác nhận người dùng chính xác.
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
    end
end
