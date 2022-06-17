class ExampleMailer < ApplicationMailer
  default from: 'nguyenanh1812zxc@gmail.com'
  def sample_email(user)
    @user = user
    mail to: @user.email, subject: 'Xác nhận tài khoản - Beta active account'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Đặt lại mật khẩu - Password reset'
  end
end
