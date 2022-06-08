class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy]
  before_action :logged_in_user, only: %i[ edit update]
  before_action :correct_user, only: %i[show edit update] # Update dung nguoi dung dang dang nhap
  before_action :admin_user, only: [:index]
  def index
    # @users = User.all
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
      ExampleMailer.sample_email(@user).deliver
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
    else
      render 'new'
    end
    # end
  end

  def update
    @user = User.find(params[:id])
    current_password = params[:user][:current_password]
    user = User.authenticate(@user.email, current_password)

    if @user && user
      if @user.update(edit_user_params)
        flash[:success] = 'Update successfully!'
        redirect_to @user
      else
        flash[:danger] = 'Something wrong'
        render 'edit'
      end
    else
      flash[:danger] = 'Wrong password'
      render 'edit'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :phonenum, :city, :favorite_cinema, :day, :month, :year,
                                 :sex)
  end

  def edit_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phonenum, :city, :favorite_cinema,
                                 :day, :month, :year, :sex)
  end

  # Xác nhận người dùng chính xác.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
