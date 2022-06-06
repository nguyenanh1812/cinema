class ExampleMailer < ApplicationMailer
  default from: 'nguyenanh1812zxc@gmail.com'
  def sample_email(user)
    @user = user
    mail to: @user.email, subject: 'Sample Email'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Password reset'
  end
end
