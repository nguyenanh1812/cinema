class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy]
  before_action :logged_in_user, only: %i[:index edit update]
  before_action :correct_user, only: %i[ edit update] # Update dung nguoi dung dang dang nhap
  before_action :admin_user, only: %i[index destroy]
  def index
    # @users = User.all
    @q = User.ransack(params[:q])
    @pagy, @users = pagy(@q.result(distinct: true), items: 10)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Người dùng đã được xóa!"
    redirect_to users_url
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
      flash[:info] = 'Hãy kiểm tra email của bạn để kích hoạt tài khoản của bạn!'
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
        flash[:success] = 'Cập nhật thành công!'
        redirect_to @user
      else
        flash[:danger] = 'Có gì đó không đúng với điều kiện!'
        render 'edit'
      end
    else
      flash[:danger] = 'Lỗi mật khẩu!'
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
